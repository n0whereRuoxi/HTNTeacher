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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4509 - OBJ
      ?auto_4508 - LOCATION
    )
    :vars
    (
      ?auto_4510 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4510 ?auto_4508 ) ( IN-TRUCK ?auto_4509 ?auto_4510 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4509 ?auto_4510 ?auto_4508 )
      ( DELIVER-1PKG-VERIFY ?auto_4509 ?auto_4508 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4521 - OBJ
      ?auto_4520 - LOCATION
    )
    :vars
    (
      ?auto_4522 - TRUCK
      ?auto_4523 - LOCATION
      ?auto_4524 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4521 ?auto_4522 ) ( TRUCK-AT ?auto_4522 ?auto_4523 ) ( IN-CITY ?auto_4523 ?auto_4524 ) ( IN-CITY ?auto_4520 ?auto_4524 ) ( not ( = ?auto_4520 ?auto_4523 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4522 ?auto_4523 ?auto_4520 ?auto_4524 )
      ( DELIVER-1PKG ?auto_4521 ?auto_4520 )
      ( DELIVER-1PKG-VERIFY ?auto_4521 ?auto_4520 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4539 - OBJ
      ?auto_4538 - LOCATION
    )
    :vars
    (
      ?auto_4542 - TRUCK
      ?auto_4540 - LOCATION
      ?auto_4541 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4542 ?auto_4540 ) ( IN-CITY ?auto_4540 ?auto_4541 ) ( IN-CITY ?auto_4538 ?auto_4541 ) ( not ( = ?auto_4538 ?auto_4540 ) ) ( OBJ-AT ?auto_4539 ?auto_4540 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4539 ?auto_4542 ?auto_4540 )
      ( DELIVER-1PKG ?auto_4539 ?auto_4538 )
      ( DELIVER-1PKG-VERIFY ?auto_4539 ?auto_4538 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4557 - OBJ
      ?auto_4556 - LOCATION
    )
    :vars
    (
      ?auto_4560 - LOCATION
      ?auto_4559 - CITY
      ?auto_4558 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4560 ?auto_4559 ) ( IN-CITY ?auto_4556 ?auto_4559 ) ( not ( = ?auto_4556 ?auto_4560 ) ) ( OBJ-AT ?auto_4557 ?auto_4560 ) ( TRUCK-AT ?auto_4558 ?auto_4556 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4558 ?auto_4556 ?auto_4560 ?auto_4559 )
      ( DELIVER-1PKG ?auto_4557 ?auto_4556 )
      ( DELIVER-1PKG-VERIFY ?auto_4557 ?auto_4556 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4614 - OBJ
      ?auto_4613 - LOCATION
    )
    :vars
    (
      ?auto_4615 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4615 ?auto_4613 ) ( IN-TRUCK ?auto_4614 ?auto_4615 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4614 ?auto_4615 ?auto_4613 )
      ( DELIVER-1PKG-VERIFY ?auto_4614 ?auto_4613 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4617 - OBJ
      ?auto_4618 - OBJ
      ?auto_4616 - LOCATION
    )
    :vars
    (
      ?auto_4619 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4618 ?auto_4617 ) ) ( TRUCK-AT ?auto_4619 ?auto_4616 ) ( IN-TRUCK ?auto_4618 ?auto_4619 ) ( OBJ-AT ?auto_4617 ?auto_4616 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4618 ?auto_4616 )
      ( DELIVER-2PKG-VERIFY ?auto_4617 ?auto_4618 ?auto_4616 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4621 - OBJ
      ?auto_4622 - OBJ
      ?auto_4620 - LOCATION
    )
    :vars
    (
      ?auto_4623 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4622 ?auto_4621 ) ) ( TRUCK-AT ?auto_4623 ?auto_4620 ) ( IN-TRUCK ?auto_4621 ?auto_4623 ) ( OBJ-AT ?auto_4622 ?auto_4620 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4621 ?auto_4620 )
      ( DELIVER-2PKG-VERIFY ?auto_4621 ?auto_4622 ?auto_4620 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4664 - OBJ
      ?auto_4663 - LOCATION
    )
    :vars
    (
      ?auto_4665 - TRUCK
      ?auto_4666 - LOCATION
      ?auto_4667 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4664 ?auto_4665 ) ( TRUCK-AT ?auto_4665 ?auto_4666 ) ( IN-CITY ?auto_4666 ?auto_4667 ) ( IN-CITY ?auto_4663 ?auto_4667 ) ( not ( = ?auto_4663 ?auto_4666 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4665 ?auto_4666 ?auto_4663 ?auto_4667 )
      ( DELIVER-1PKG ?auto_4664 ?auto_4663 )
      ( DELIVER-1PKG-VERIFY ?auto_4664 ?auto_4663 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4669 - OBJ
      ?auto_4670 - OBJ
      ?auto_4668 - LOCATION
    )
    :vars
    (
      ?auto_4671 - TRUCK
      ?auto_4672 - LOCATION
      ?auto_4673 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_4670 ?auto_4669 ) ) ( IN-TRUCK ?auto_4670 ?auto_4671 ) ( TRUCK-AT ?auto_4671 ?auto_4672 ) ( IN-CITY ?auto_4672 ?auto_4673 ) ( IN-CITY ?auto_4668 ?auto_4673 ) ( not ( = ?auto_4668 ?auto_4672 ) ) ( OBJ-AT ?auto_4669 ?auto_4668 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4670 ?auto_4668 )
      ( DELIVER-2PKG-VERIFY ?auto_4669 ?auto_4670 ?auto_4668 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4675 - OBJ
      ?auto_4676 - OBJ
      ?auto_4674 - LOCATION
    )
    :vars
    (
      ?auto_4677 - TRUCK
      ?auto_4679 - LOCATION
      ?auto_4678 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_4676 ?auto_4675 ) ) ( IN-TRUCK ?auto_4675 ?auto_4677 ) ( TRUCK-AT ?auto_4677 ?auto_4679 ) ( IN-CITY ?auto_4679 ?auto_4678 ) ( IN-CITY ?auto_4674 ?auto_4678 ) ( not ( = ?auto_4674 ?auto_4679 ) ) ( OBJ-AT ?auto_4676 ?auto_4674 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4676 ?auto_4675 ?auto_4674 )
      ( DELIVER-2PKG-VERIFY ?auto_4675 ?auto_4676 ?auto_4674 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4738 - OBJ
      ?auto_4737 - LOCATION
    )
    :vars
    (
      ?auto_4739 - OBJ
      ?auto_4740 - TRUCK
      ?auto_4742 - LOCATION
      ?auto_4741 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_4738 ?auto_4739 ) ) ( TRUCK-AT ?auto_4740 ?auto_4742 ) ( IN-CITY ?auto_4742 ?auto_4741 ) ( IN-CITY ?auto_4737 ?auto_4741 ) ( not ( = ?auto_4737 ?auto_4742 ) ) ( OBJ-AT ?auto_4739 ?auto_4737 ) ( OBJ-AT ?auto_4738 ?auto_4742 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4738 ?auto_4740 ?auto_4742 )
      ( DELIVER-2PKG ?auto_4739 ?auto_4738 ?auto_4737 )
      ( DELIVER-1PKG-VERIFY ?auto_4738 ?auto_4737 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4744 - OBJ
      ?auto_4745 - OBJ
      ?auto_4743 - LOCATION
    )
    :vars
    (
      ?auto_4748 - TRUCK
      ?auto_4747 - LOCATION
      ?auto_4746 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_4745 ?auto_4744 ) ) ( TRUCK-AT ?auto_4748 ?auto_4747 ) ( IN-CITY ?auto_4747 ?auto_4746 ) ( IN-CITY ?auto_4743 ?auto_4746 ) ( not ( = ?auto_4743 ?auto_4747 ) ) ( OBJ-AT ?auto_4744 ?auto_4743 ) ( OBJ-AT ?auto_4745 ?auto_4747 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4745 ?auto_4743 )
      ( DELIVER-2PKG-VERIFY ?auto_4744 ?auto_4745 ?auto_4743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4750 - OBJ
      ?auto_4751 - OBJ
      ?auto_4749 - LOCATION
    )
    :vars
    (
      ?auto_4752 - TRUCK
      ?auto_4753 - LOCATION
      ?auto_4754 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_4751 ?auto_4750 ) ) ( TRUCK-AT ?auto_4752 ?auto_4753 ) ( IN-CITY ?auto_4753 ?auto_4754 ) ( IN-CITY ?auto_4749 ?auto_4754 ) ( not ( = ?auto_4749 ?auto_4753 ) ) ( OBJ-AT ?auto_4751 ?auto_4749 ) ( OBJ-AT ?auto_4750 ?auto_4753 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4751 ?auto_4750 ?auto_4749 )
      ( DELIVER-2PKG-VERIFY ?auto_4750 ?auto_4751 ?auto_4749 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4813 - OBJ
      ?auto_4812 - LOCATION
    )
    :vars
    (
      ?auto_4817 - OBJ
      ?auto_4815 - LOCATION
      ?auto_4816 - CITY
      ?auto_4814 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4813 ?auto_4817 ) ) ( IN-CITY ?auto_4815 ?auto_4816 ) ( IN-CITY ?auto_4812 ?auto_4816 ) ( not ( = ?auto_4812 ?auto_4815 ) ) ( OBJ-AT ?auto_4817 ?auto_4812 ) ( OBJ-AT ?auto_4813 ?auto_4815 ) ( TRUCK-AT ?auto_4814 ?auto_4812 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4814 ?auto_4812 ?auto_4815 ?auto_4816 )
      ( DELIVER-2PKG ?auto_4817 ?auto_4813 ?auto_4812 )
      ( DELIVER-1PKG-VERIFY ?auto_4813 ?auto_4812 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4819 - OBJ
      ?auto_4820 - OBJ
      ?auto_4818 - LOCATION
    )
    :vars
    (
      ?auto_4823 - LOCATION
      ?auto_4821 - CITY
      ?auto_4822 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4820 ?auto_4819 ) ) ( IN-CITY ?auto_4823 ?auto_4821 ) ( IN-CITY ?auto_4818 ?auto_4821 ) ( not ( = ?auto_4818 ?auto_4823 ) ) ( OBJ-AT ?auto_4819 ?auto_4818 ) ( OBJ-AT ?auto_4820 ?auto_4823 ) ( TRUCK-AT ?auto_4822 ?auto_4818 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4820 ?auto_4818 )
      ( DELIVER-2PKG-VERIFY ?auto_4819 ?auto_4820 ?auto_4818 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4825 - OBJ
      ?auto_4826 - OBJ
      ?auto_4824 - LOCATION
    )
    :vars
    (
      ?auto_4828 - LOCATION
      ?auto_4827 - CITY
      ?auto_4829 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4826 ?auto_4825 ) ) ( IN-CITY ?auto_4828 ?auto_4827 ) ( IN-CITY ?auto_4824 ?auto_4827 ) ( not ( = ?auto_4824 ?auto_4828 ) ) ( OBJ-AT ?auto_4826 ?auto_4824 ) ( OBJ-AT ?auto_4825 ?auto_4828 ) ( TRUCK-AT ?auto_4829 ?auto_4824 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4826 ?auto_4825 ?auto_4824 )
      ( DELIVER-2PKG-VERIFY ?auto_4825 ?auto_4826 ?auto_4824 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4888 - OBJ
      ?auto_4887 - LOCATION
    )
    :vars
    (
      ?auto_4889 - OBJ
      ?auto_4891 - LOCATION
      ?auto_4890 - CITY
      ?auto_4892 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4888 ?auto_4889 ) ) ( IN-CITY ?auto_4891 ?auto_4890 ) ( IN-CITY ?auto_4887 ?auto_4890 ) ( not ( = ?auto_4887 ?auto_4891 ) ) ( OBJ-AT ?auto_4888 ?auto_4891 ) ( TRUCK-AT ?auto_4892 ?auto_4887 ) ( IN-TRUCK ?auto_4889 ?auto_4892 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4889 ?auto_4887 )
      ( DELIVER-2PKG ?auto_4889 ?auto_4888 ?auto_4887 )
      ( DELIVER-1PKG-VERIFY ?auto_4888 ?auto_4887 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4894 - OBJ
      ?auto_4895 - OBJ
      ?auto_4893 - LOCATION
    )
    :vars
    (
      ?auto_4897 - LOCATION
      ?auto_4896 - CITY
      ?auto_4898 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4895 ?auto_4894 ) ) ( IN-CITY ?auto_4897 ?auto_4896 ) ( IN-CITY ?auto_4893 ?auto_4896 ) ( not ( = ?auto_4893 ?auto_4897 ) ) ( OBJ-AT ?auto_4895 ?auto_4897 ) ( TRUCK-AT ?auto_4898 ?auto_4893 ) ( IN-TRUCK ?auto_4894 ?auto_4898 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4895 ?auto_4893 )
      ( DELIVER-2PKG-VERIFY ?auto_4894 ?auto_4895 ?auto_4893 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4900 - OBJ
      ?auto_4901 - OBJ
      ?auto_4899 - LOCATION
    )
    :vars
    (
      ?auto_4904 - LOCATION
      ?auto_4902 - CITY
      ?auto_4903 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4901 ?auto_4900 ) ) ( IN-CITY ?auto_4904 ?auto_4902 ) ( IN-CITY ?auto_4899 ?auto_4902 ) ( not ( = ?auto_4899 ?auto_4904 ) ) ( OBJ-AT ?auto_4900 ?auto_4904 ) ( TRUCK-AT ?auto_4903 ?auto_4899 ) ( IN-TRUCK ?auto_4901 ?auto_4903 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4901 ?auto_4900 ?auto_4899 )
      ( DELIVER-2PKG-VERIFY ?auto_4900 ?auto_4901 ?auto_4899 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4963 - OBJ
      ?auto_4962 - LOCATION
    )
    :vars
    (
      ?auto_4966 - OBJ
      ?auto_4967 - LOCATION
      ?auto_4964 - CITY
      ?auto_4965 - TRUCK
      ?auto_4968 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4963 ?auto_4966 ) ) ( IN-CITY ?auto_4967 ?auto_4964 ) ( IN-CITY ?auto_4962 ?auto_4964 ) ( not ( = ?auto_4962 ?auto_4967 ) ) ( OBJ-AT ?auto_4963 ?auto_4967 ) ( IN-TRUCK ?auto_4966 ?auto_4965 ) ( TRUCK-AT ?auto_4965 ?auto_4968 ) ( IN-CITY ?auto_4968 ?auto_4964 ) ( not ( = ?auto_4962 ?auto_4968 ) ) ( not ( = ?auto_4967 ?auto_4968 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4965 ?auto_4968 ?auto_4962 ?auto_4964 )
      ( DELIVER-2PKG ?auto_4966 ?auto_4963 ?auto_4962 )
      ( DELIVER-1PKG-VERIFY ?auto_4963 ?auto_4962 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4970 - OBJ
      ?auto_4971 - OBJ
      ?auto_4969 - LOCATION
    )
    :vars
    (
      ?auto_4973 - LOCATION
      ?auto_4975 - CITY
      ?auto_4974 - TRUCK
      ?auto_4972 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4971 ?auto_4970 ) ) ( IN-CITY ?auto_4973 ?auto_4975 ) ( IN-CITY ?auto_4969 ?auto_4975 ) ( not ( = ?auto_4969 ?auto_4973 ) ) ( OBJ-AT ?auto_4971 ?auto_4973 ) ( IN-TRUCK ?auto_4970 ?auto_4974 ) ( TRUCK-AT ?auto_4974 ?auto_4972 ) ( IN-CITY ?auto_4972 ?auto_4975 ) ( not ( = ?auto_4969 ?auto_4972 ) ) ( not ( = ?auto_4973 ?auto_4972 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4971 ?auto_4969 )
      ( DELIVER-2PKG-VERIFY ?auto_4970 ?auto_4971 ?auto_4969 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4977 - OBJ
      ?auto_4978 - OBJ
      ?auto_4976 - LOCATION
    )
    :vars
    (
      ?auto_4979 - LOCATION
      ?auto_4980 - CITY
      ?auto_4982 - TRUCK
      ?auto_4981 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4978 ?auto_4977 ) ) ( IN-CITY ?auto_4979 ?auto_4980 ) ( IN-CITY ?auto_4976 ?auto_4980 ) ( not ( = ?auto_4976 ?auto_4979 ) ) ( OBJ-AT ?auto_4977 ?auto_4979 ) ( IN-TRUCK ?auto_4978 ?auto_4982 ) ( TRUCK-AT ?auto_4982 ?auto_4981 ) ( IN-CITY ?auto_4981 ?auto_4980 ) ( not ( = ?auto_4976 ?auto_4981 ) ) ( not ( = ?auto_4979 ?auto_4981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4978 ?auto_4977 ?auto_4976 )
      ( DELIVER-2PKG-VERIFY ?auto_4977 ?auto_4978 ?auto_4976 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5049 - OBJ
      ?auto_5048 - LOCATION
    )
    :vars
    (
      ?auto_5051 - OBJ
      ?auto_5050 - LOCATION
      ?auto_5052 - CITY
      ?auto_5054 - TRUCK
      ?auto_5053 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_5049 ?auto_5051 ) ) ( IN-CITY ?auto_5050 ?auto_5052 ) ( IN-CITY ?auto_5048 ?auto_5052 ) ( not ( = ?auto_5048 ?auto_5050 ) ) ( OBJ-AT ?auto_5049 ?auto_5050 ) ( TRUCK-AT ?auto_5054 ?auto_5053 ) ( IN-CITY ?auto_5053 ?auto_5052 ) ( not ( = ?auto_5048 ?auto_5053 ) ) ( not ( = ?auto_5050 ?auto_5053 ) ) ( OBJ-AT ?auto_5051 ?auto_5053 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5051 ?auto_5054 ?auto_5053 )
      ( DELIVER-2PKG ?auto_5051 ?auto_5049 ?auto_5048 )
      ( DELIVER-1PKG-VERIFY ?auto_5049 ?auto_5048 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5056 - OBJ
      ?auto_5057 - OBJ
      ?auto_5055 - LOCATION
    )
    :vars
    (
      ?auto_5061 - LOCATION
      ?auto_5059 - CITY
      ?auto_5060 - TRUCK
      ?auto_5058 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_5057 ?auto_5056 ) ) ( IN-CITY ?auto_5061 ?auto_5059 ) ( IN-CITY ?auto_5055 ?auto_5059 ) ( not ( = ?auto_5055 ?auto_5061 ) ) ( OBJ-AT ?auto_5057 ?auto_5061 ) ( TRUCK-AT ?auto_5060 ?auto_5058 ) ( IN-CITY ?auto_5058 ?auto_5059 ) ( not ( = ?auto_5055 ?auto_5058 ) ) ( not ( = ?auto_5061 ?auto_5058 ) ) ( OBJ-AT ?auto_5056 ?auto_5058 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5057 ?auto_5055 )
      ( DELIVER-2PKG-VERIFY ?auto_5056 ?auto_5057 ?auto_5055 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5063 - OBJ
      ?auto_5064 - OBJ
      ?auto_5062 - LOCATION
    )
    :vars
    (
      ?auto_5065 - LOCATION
      ?auto_5066 - CITY
      ?auto_5067 - TRUCK
      ?auto_5068 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_5064 ?auto_5063 ) ) ( IN-CITY ?auto_5065 ?auto_5066 ) ( IN-CITY ?auto_5062 ?auto_5066 ) ( not ( = ?auto_5062 ?auto_5065 ) ) ( OBJ-AT ?auto_5063 ?auto_5065 ) ( TRUCK-AT ?auto_5067 ?auto_5068 ) ( IN-CITY ?auto_5068 ?auto_5066 ) ( not ( = ?auto_5062 ?auto_5068 ) ) ( not ( = ?auto_5065 ?auto_5068 ) ) ( OBJ-AT ?auto_5064 ?auto_5068 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5064 ?auto_5063 ?auto_5062 )
      ( DELIVER-2PKG-VERIFY ?auto_5063 ?auto_5064 ?auto_5062 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5135 - OBJ
      ?auto_5134 - LOCATION
    )
    :vars
    (
      ?auto_5140 - OBJ
      ?auto_5136 - LOCATION
      ?auto_5137 - CITY
      ?auto_5139 - LOCATION
      ?auto_5138 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5135 ?auto_5140 ) ) ( IN-CITY ?auto_5136 ?auto_5137 ) ( IN-CITY ?auto_5134 ?auto_5137 ) ( not ( = ?auto_5134 ?auto_5136 ) ) ( OBJ-AT ?auto_5135 ?auto_5136 ) ( IN-CITY ?auto_5139 ?auto_5137 ) ( not ( = ?auto_5134 ?auto_5139 ) ) ( not ( = ?auto_5136 ?auto_5139 ) ) ( OBJ-AT ?auto_5140 ?auto_5139 ) ( TRUCK-AT ?auto_5138 ?auto_5134 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5138 ?auto_5134 ?auto_5139 ?auto_5137 )
      ( DELIVER-2PKG ?auto_5140 ?auto_5135 ?auto_5134 )
      ( DELIVER-1PKG-VERIFY ?auto_5135 ?auto_5134 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5142 - OBJ
      ?auto_5143 - OBJ
      ?auto_5141 - LOCATION
    )
    :vars
    (
      ?auto_5146 - LOCATION
      ?auto_5147 - CITY
      ?auto_5144 - LOCATION
      ?auto_5145 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5143 ?auto_5142 ) ) ( IN-CITY ?auto_5146 ?auto_5147 ) ( IN-CITY ?auto_5141 ?auto_5147 ) ( not ( = ?auto_5141 ?auto_5146 ) ) ( OBJ-AT ?auto_5143 ?auto_5146 ) ( IN-CITY ?auto_5144 ?auto_5147 ) ( not ( = ?auto_5141 ?auto_5144 ) ) ( not ( = ?auto_5146 ?auto_5144 ) ) ( OBJ-AT ?auto_5142 ?auto_5144 ) ( TRUCK-AT ?auto_5145 ?auto_5141 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5143 ?auto_5141 )
      ( DELIVER-2PKG-VERIFY ?auto_5142 ?auto_5143 ?auto_5141 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5149 - OBJ
      ?auto_5150 - OBJ
      ?auto_5148 - LOCATION
    )
    :vars
    (
      ?auto_5154 - LOCATION
      ?auto_5152 - CITY
      ?auto_5153 - LOCATION
      ?auto_5151 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5150 ?auto_5149 ) ) ( IN-CITY ?auto_5154 ?auto_5152 ) ( IN-CITY ?auto_5148 ?auto_5152 ) ( not ( = ?auto_5148 ?auto_5154 ) ) ( OBJ-AT ?auto_5149 ?auto_5154 ) ( IN-CITY ?auto_5153 ?auto_5152 ) ( not ( = ?auto_5148 ?auto_5153 ) ) ( not ( = ?auto_5154 ?auto_5153 ) ) ( OBJ-AT ?auto_5150 ?auto_5153 ) ( TRUCK-AT ?auto_5151 ?auto_5148 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5150 ?auto_5149 ?auto_5148 )
      ( DELIVER-2PKG-VERIFY ?auto_5149 ?auto_5150 ?auto_5148 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5314 - OBJ
      ?auto_5313 - LOCATION
    )
    :vars
    (
      ?auto_5315 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5315 ?auto_5313 ) ( IN-TRUCK ?auto_5314 ?auto_5315 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_5314 ?auto_5315 ?auto_5313 )
      ( DELIVER-1PKG-VERIFY ?auto_5314 ?auto_5313 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5317 - OBJ
      ?auto_5318 - OBJ
      ?auto_5316 - LOCATION
    )
    :vars
    (
      ?auto_5319 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5318 ?auto_5317 ) ) ( TRUCK-AT ?auto_5319 ?auto_5316 ) ( IN-TRUCK ?auto_5318 ?auto_5319 ) ( OBJ-AT ?auto_5317 ?auto_5316 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5318 ?auto_5316 )
      ( DELIVER-2PKG-VERIFY ?auto_5317 ?auto_5318 ?auto_5316 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5321 - OBJ
      ?auto_5322 - OBJ
      ?auto_5320 - LOCATION
    )
    :vars
    (
      ?auto_5323 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5322 ?auto_5321 ) ) ( TRUCK-AT ?auto_5323 ?auto_5320 ) ( IN-TRUCK ?auto_5322 ?auto_5323 ) ( OBJ-AT ?auto_5321 ?auto_5320 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5322 ?auto_5320 )
      ( DELIVER-2PKG-VERIFY ?auto_5321 ?auto_5322 ?auto_5320 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5325 - OBJ
      ?auto_5326 - OBJ
      ?auto_5324 - LOCATION
    )
    :vars
    (
      ?auto_5327 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5326 ?auto_5325 ) ) ( TRUCK-AT ?auto_5327 ?auto_5324 ) ( IN-TRUCK ?auto_5325 ?auto_5327 ) ( OBJ-AT ?auto_5326 ?auto_5324 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5325 ?auto_5324 )
      ( DELIVER-2PKG-VERIFY ?auto_5325 ?auto_5326 ?auto_5324 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5329 - OBJ
      ?auto_5330 - OBJ
      ?auto_5328 - LOCATION
    )
    :vars
    (
      ?auto_5331 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5330 ?auto_5329 ) ) ( TRUCK-AT ?auto_5331 ?auto_5328 ) ( IN-TRUCK ?auto_5329 ?auto_5331 ) ( OBJ-AT ?auto_5330 ?auto_5328 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5329 ?auto_5328 )
      ( DELIVER-2PKG-VERIFY ?auto_5329 ?auto_5330 ?auto_5328 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5342 - OBJ
      ?auto_5343 - OBJ
      ?auto_5344 - OBJ
      ?auto_5341 - LOCATION
    )
    :vars
    (
      ?auto_5345 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5343 ?auto_5342 ) ) ( not ( = ?auto_5344 ?auto_5342 ) ) ( not ( = ?auto_5344 ?auto_5343 ) ) ( TRUCK-AT ?auto_5345 ?auto_5341 ) ( IN-TRUCK ?auto_5344 ?auto_5345 ) ( OBJ-AT ?auto_5342 ?auto_5341 ) ( OBJ-AT ?auto_5343 ?auto_5341 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5344 ?auto_5341 )
      ( DELIVER-3PKG-VERIFY ?auto_5342 ?auto_5343 ?auto_5344 ?auto_5341 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5352 - OBJ
      ?auto_5353 - OBJ
      ?auto_5354 - OBJ
      ?auto_5351 - LOCATION
    )
    :vars
    (
      ?auto_5355 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5353 ?auto_5352 ) ) ( not ( = ?auto_5354 ?auto_5352 ) ) ( not ( = ?auto_5354 ?auto_5353 ) ) ( TRUCK-AT ?auto_5355 ?auto_5351 ) ( IN-TRUCK ?auto_5353 ?auto_5355 ) ( OBJ-AT ?auto_5352 ?auto_5351 ) ( OBJ-AT ?auto_5354 ?auto_5351 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5353 ?auto_5351 )
      ( DELIVER-3PKG-VERIFY ?auto_5352 ?auto_5353 ?auto_5354 ?auto_5351 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5362 - OBJ
      ?auto_5363 - OBJ
      ?auto_5364 - OBJ
      ?auto_5361 - LOCATION
    )
    :vars
    (
      ?auto_5365 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5363 ?auto_5362 ) ) ( not ( = ?auto_5364 ?auto_5362 ) ) ( not ( = ?auto_5364 ?auto_5363 ) ) ( TRUCK-AT ?auto_5365 ?auto_5361 ) ( IN-TRUCK ?auto_5364 ?auto_5365 ) ( OBJ-AT ?auto_5362 ?auto_5361 ) ( OBJ-AT ?auto_5363 ?auto_5361 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5364 ?auto_5361 )
      ( DELIVER-3PKG-VERIFY ?auto_5362 ?auto_5363 ?auto_5364 ?auto_5361 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5372 - OBJ
      ?auto_5373 - OBJ
      ?auto_5374 - OBJ
      ?auto_5371 - LOCATION
    )
    :vars
    (
      ?auto_5375 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5373 ?auto_5372 ) ) ( not ( = ?auto_5374 ?auto_5372 ) ) ( not ( = ?auto_5374 ?auto_5373 ) ) ( TRUCK-AT ?auto_5375 ?auto_5371 ) ( IN-TRUCK ?auto_5373 ?auto_5375 ) ( OBJ-AT ?auto_5372 ?auto_5371 ) ( OBJ-AT ?auto_5374 ?auto_5371 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5373 ?auto_5371 )
      ( DELIVER-3PKG-VERIFY ?auto_5372 ?auto_5373 ?auto_5374 ?auto_5371 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5392 - OBJ
      ?auto_5393 - OBJ
      ?auto_5394 - OBJ
      ?auto_5391 - LOCATION
    )
    :vars
    (
      ?auto_5395 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5393 ?auto_5392 ) ) ( not ( = ?auto_5394 ?auto_5392 ) ) ( not ( = ?auto_5394 ?auto_5393 ) ) ( TRUCK-AT ?auto_5395 ?auto_5391 ) ( IN-TRUCK ?auto_5392 ?auto_5395 ) ( OBJ-AT ?auto_5393 ?auto_5391 ) ( OBJ-AT ?auto_5394 ?auto_5391 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5392 ?auto_5391 )
      ( DELIVER-3PKG-VERIFY ?auto_5392 ?auto_5393 ?auto_5394 ?auto_5391 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5402 - OBJ
      ?auto_5403 - OBJ
      ?auto_5404 - OBJ
      ?auto_5401 - LOCATION
    )
    :vars
    (
      ?auto_5405 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5403 ?auto_5402 ) ) ( not ( = ?auto_5404 ?auto_5402 ) ) ( not ( = ?auto_5404 ?auto_5403 ) ) ( TRUCK-AT ?auto_5405 ?auto_5401 ) ( IN-TRUCK ?auto_5402 ?auto_5405 ) ( OBJ-AT ?auto_5403 ?auto_5401 ) ( OBJ-AT ?auto_5404 ?auto_5401 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5402 ?auto_5401 )
      ( DELIVER-3PKG-VERIFY ?auto_5402 ?auto_5403 ?auto_5404 ?auto_5401 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5432 - OBJ
      ?auto_5431 - LOCATION
    )
    :vars
    (
      ?auto_5433 - TRUCK
      ?auto_5434 - LOCATION
      ?auto_5435 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5432 ?auto_5433 ) ( TRUCK-AT ?auto_5433 ?auto_5434 ) ( IN-CITY ?auto_5434 ?auto_5435 ) ( IN-CITY ?auto_5431 ?auto_5435 ) ( not ( = ?auto_5431 ?auto_5434 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5433 ?auto_5434 ?auto_5431 ?auto_5435 )
      ( DELIVER-1PKG ?auto_5432 ?auto_5431 )
      ( DELIVER-1PKG-VERIFY ?auto_5432 ?auto_5431 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5437 - OBJ
      ?auto_5438 - OBJ
      ?auto_5436 - LOCATION
    )
    :vars
    (
      ?auto_5439 - TRUCK
      ?auto_5440 - LOCATION
      ?auto_5441 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5438 ?auto_5437 ) ) ( IN-TRUCK ?auto_5438 ?auto_5439 ) ( TRUCK-AT ?auto_5439 ?auto_5440 ) ( IN-CITY ?auto_5440 ?auto_5441 ) ( IN-CITY ?auto_5436 ?auto_5441 ) ( not ( = ?auto_5436 ?auto_5440 ) ) ( OBJ-AT ?auto_5437 ?auto_5436 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5438 ?auto_5436 )
      ( DELIVER-2PKG-VERIFY ?auto_5437 ?auto_5438 ?auto_5436 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5443 - OBJ
      ?auto_5444 - OBJ
      ?auto_5442 - LOCATION
    )
    :vars
    (
      ?auto_5448 - OBJ
      ?auto_5446 - TRUCK
      ?auto_5445 - LOCATION
      ?auto_5447 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5444 ?auto_5443 ) ) ( not ( = ?auto_5444 ?auto_5448 ) ) ( IN-TRUCK ?auto_5444 ?auto_5446 ) ( TRUCK-AT ?auto_5446 ?auto_5445 ) ( IN-CITY ?auto_5445 ?auto_5447 ) ( IN-CITY ?auto_5442 ?auto_5447 ) ( not ( = ?auto_5442 ?auto_5445 ) ) ( OBJ-AT ?auto_5448 ?auto_5442 ) ( OBJ-AT ?auto_5443 ?auto_5442 ) ( not ( = ?auto_5443 ?auto_5448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5448 ?auto_5444 ?auto_5442 )
      ( DELIVER-2PKG-VERIFY ?auto_5443 ?auto_5444 ?auto_5442 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5450 - OBJ
      ?auto_5451 - OBJ
      ?auto_5449 - LOCATION
    )
    :vars
    (
      ?auto_5453 - TRUCK
      ?auto_5452 - LOCATION
      ?auto_5454 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5451 ?auto_5450 ) ) ( IN-TRUCK ?auto_5450 ?auto_5453 ) ( TRUCK-AT ?auto_5453 ?auto_5452 ) ( IN-CITY ?auto_5452 ?auto_5454 ) ( IN-CITY ?auto_5449 ?auto_5454 ) ( not ( = ?auto_5449 ?auto_5452 ) ) ( OBJ-AT ?auto_5451 ?auto_5449 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5451 ?auto_5450 ?auto_5449 )
      ( DELIVER-2PKG-VERIFY ?auto_5450 ?auto_5451 ?auto_5449 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5456 - OBJ
      ?auto_5457 - OBJ
      ?auto_5455 - LOCATION
    )
    :vars
    (
      ?auto_5461 - OBJ
      ?auto_5459 - TRUCK
      ?auto_5458 - LOCATION
      ?auto_5460 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5457 ?auto_5456 ) ) ( not ( = ?auto_5456 ?auto_5461 ) ) ( IN-TRUCK ?auto_5456 ?auto_5459 ) ( TRUCK-AT ?auto_5459 ?auto_5458 ) ( IN-CITY ?auto_5458 ?auto_5460 ) ( IN-CITY ?auto_5455 ?auto_5460 ) ( not ( = ?auto_5455 ?auto_5458 ) ) ( OBJ-AT ?auto_5461 ?auto_5455 ) ( OBJ-AT ?auto_5457 ?auto_5455 ) ( not ( = ?auto_5457 ?auto_5461 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5461 ?auto_5456 ?auto_5455 )
      ( DELIVER-2PKG-VERIFY ?auto_5456 ?auto_5457 ?auto_5455 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5477 - OBJ
      ?auto_5478 - OBJ
      ?auto_5479 - OBJ
      ?auto_5476 - LOCATION
    )
    :vars
    (
      ?auto_5481 - TRUCK
      ?auto_5480 - LOCATION
      ?auto_5482 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5478 ?auto_5477 ) ) ( not ( = ?auto_5479 ?auto_5477 ) ) ( not ( = ?auto_5479 ?auto_5478 ) ) ( IN-TRUCK ?auto_5479 ?auto_5481 ) ( TRUCK-AT ?auto_5481 ?auto_5480 ) ( IN-CITY ?auto_5480 ?auto_5482 ) ( IN-CITY ?auto_5476 ?auto_5482 ) ( not ( = ?auto_5476 ?auto_5480 ) ) ( OBJ-AT ?auto_5477 ?auto_5476 ) ( OBJ-AT ?auto_5478 ?auto_5476 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5477 ?auto_5479 ?auto_5476 )
      ( DELIVER-3PKG-VERIFY ?auto_5477 ?auto_5478 ?auto_5479 ?auto_5476 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5491 - OBJ
      ?auto_5492 - OBJ
      ?auto_5493 - OBJ
      ?auto_5490 - LOCATION
    )
    :vars
    (
      ?auto_5495 - TRUCK
      ?auto_5494 - LOCATION
      ?auto_5496 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5492 ?auto_5491 ) ) ( not ( = ?auto_5493 ?auto_5491 ) ) ( not ( = ?auto_5493 ?auto_5492 ) ) ( IN-TRUCK ?auto_5492 ?auto_5495 ) ( TRUCK-AT ?auto_5495 ?auto_5494 ) ( IN-CITY ?auto_5494 ?auto_5496 ) ( IN-CITY ?auto_5490 ?auto_5496 ) ( not ( = ?auto_5490 ?auto_5494 ) ) ( OBJ-AT ?auto_5491 ?auto_5490 ) ( OBJ-AT ?auto_5493 ?auto_5490 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5491 ?auto_5492 ?auto_5490 )
      ( DELIVER-3PKG-VERIFY ?auto_5491 ?auto_5492 ?auto_5493 ?auto_5490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5505 - OBJ
      ?auto_5506 - OBJ
      ?auto_5507 - OBJ
      ?auto_5504 - LOCATION
    )
    :vars
    (
      ?auto_5509 - TRUCK
      ?auto_5508 - LOCATION
      ?auto_5510 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5506 ?auto_5505 ) ) ( not ( = ?auto_5507 ?auto_5505 ) ) ( not ( = ?auto_5507 ?auto_5506 ) ) ( IN-TRUCK ?auto_5507 ?auto_5509 ) ( TRUCK-AT ?auto_5509 ?auto_5508 ) ( IN-CITY ?auto_5508 ?auto_5510 ) ( IN-CITY ?auto_5504 ?auto_5510 ) ( not ( = ?auto_5504 ?auto_5508 ) ) ( OBJ-AT ?auto_5506 ?auto_5504 ) ( OBJ-AT ?auto_5505 ?auto_5504 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5506 ?auto_5507 ?auto_5504 )
      ( DELIVER-3PKG-VERIFY ?auto_5505 ?auto_5506 ?auto_5507 ?auto_5504 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5520 - OBJ
      ?auto_5521 - OBJ
      ?auto_5522 - OBJ
      ?auto_5519 - LOCATION
    )
    :vars
    (
      ?auto_5524 - TRUCK
      ?auto_5523 - LOCATION
      ?auto_5525 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5521 ?auto_5520 ) ) ( not ( = ?auto_5522 ?auto_5520 ) ) ( not ( = ?auto_5522 ?auto_5521 ) ) ( IN-TRUCK ?auto_5521 ?auto_5524 ) ( TRUCK-AT ?auto_5524 ?auto_5523 ) ( IN-CITY ?auto_5523 ?auto_5525 ) ( IN-CITY ?auto_5519 ?auto_5525 ) ( not ( = ?auto_5519 ?auto_5523 ) ) ( OBJ-AT ?auto_5522 ?auto_5519 ) ( OBJ-AT ?auto_5520 ?auto_5519 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5522 ?auto_5521 ?auto_5519 )
      ( DELIVER-3PKG-VERIFY ?auto_5520 ?auto_5521 ?auto_5522 ?auto_5519 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5550 - OBJ
      ?auto_5551 - OBJ
      ?auto_5552 - OBJ
      ?auto_5549 - LOCATION
    )
    :vars
    (
      ?auto_5554 - TRUCK
      ?auto_5553 - LOCATION
      ?auto_5555 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5551 ?auto_5550 ) ) ( not ( = ?auto_5552 ?auto_5550 ) ) ( not ( = ?auto_5552 ?auto_5551 ) ) ( IN-TRUCK ?auto_5550 ?auto_5554 ) ( TRUCK-AT ?auto_5554 ?auto_5553 ) ( IN-CITY ?auto_5553 ?auto_5555 ) ( IN-CITY ?auto_5549 ?auto_5555 ) ( not ( = ?auto_5549 ?auto_5553 ) ) ( OBJ-AT ?auto_5551 ?auto_5549 ) ( OBJ-AT ?auto_5552 ?auto_5549 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5551 ?auto_5550 ?auto_5549 )
      ( DELIVER-3PKG-VERIFY ?auto_5550 ?auto_5551 ?auto_5552 ?auto_5549 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5564 - OBJ
      ?auto_5565 - OBJ
      ?auto_5566 - OBJ
      ?auto_5563 - LOCATION
    )
    :vars
    (
      ?auto_5568 - TRUCK
      ?auto_5567 - LOCATION
      ?auto_5569 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5565 ?auto_5564 ) ) ( not ( = ?auto_5566 ?auto_5564 ) ) ( not ( = ?auto_5566 ?auto_5565 ) ) ( IN-TRUCK ?auto_5564 ?auto_5568 ) ( TRUCK-AT ?auto_5568 ?auto_5567 ) ( IN-CITY ?auto_5567 ?auto_5569 ) ( IN-CITY ?auto_5563 ?auto_5569 ) ( not ( = ?auto_5563 ?auto_5567 ) ) ( OBJ-AT ?auto_5566 ?auto_5563 ) ( OBJ-AT ?auto_5565 ?auto_5563 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5566 ?auto_5564 ?auto_5563 )
      ( DELIVER-3PKG-VERIFY ?auto_5564 ?auto_5565 ?auto_5566 ?auto_5563 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5610 - OBJ
      ?auto_5609 - LOCATION
    )
    :vars
    (
      ?auto_5614 - OBJ
      ?auto_5612 - TRUCK
      ?auto_5611 - LOCATION
      ?auto_5613 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5610 ?auto_5614 ) ) ( TRUCK-AT ?auto_5612 ?auto_5611 ) ( IN-CITY ?auto_5611 ?auto_5613 ) ( IN-CITY ?auto_5609 ?auto_5613 ) ( not ( = ?auto_5609 ?auto_5611 ) ) ( OBJ-AT ?auto_5614 ?auto_5609 ) ( OBJ-AT ?auto_5610 ?auto_5611 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5610 ?auto_5612 ?auto_5611 )
      ( DELIVER-2PKG ?auto_5614 ?auto_5610 ?auto_5609 )
      ( DELIVER-1PKG-VERIFY ?auto_5610 ?auto_5609 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5616 - OBJ
      ?auto_5617 - OBJ
      ?auto_5615 - LOCATION
    )
    :vars
    (
      ?auto_5618 - TRUCK
      ?auto_5620 - LOCATION
      ?auto_5619 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5617 ?auto_5616 ) ) ( TRUCK-AT ?auto_5618 ?auto_5620 ) ( IN-CITY ?auto_5620 ?auto_5619 ) ( IN-CITY ?auto_5615 ?auto_5619 ) ( not ( = ?auto_5615 ?auto_5620 ) ) ( OBJ-AT ?auto_5616 ?auto_5615 ) ( OBJ-AT ?auto_5617 ?auto_5620 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5617 ?auto_5615 )
      ( DELIVER-2PKG-VERIFY ?auto_5616 ?auto_5617 ?auto_5615 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5622 - OBJ
      ?auto_5623 - OBJ
      ?auto_5621 - LOCATION
    )
    :vars
    (
      ?auto_5627 - OBJ
      ?auto_5624 - TRUCK
      ?auto_5626 - LOCATION
      ?auto_5625 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5623 ?auto_5622 ) ) ( not ( = ?auto_5623 ?auto_5627 ) ) ( TRUCK-AT ?auto_5624 ?auto_5626 ) ( IN-CITY ?auto_5626 ?auto_5625 ) ( IN-CITY ?auto_5621 ?auto_5625 ) ( not ( = ?auto_5621 ?auto_5626 ) ) ( OBJ-AT ?auto_5627 ?auto_5621 ) ( OBJ-AT ?auto_5623 ?auto_5626 ) ( OBJ-AT ?auto_5622 ?auto_5621 ) ( not ( = ?auto_5622 ?auto_5627 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5627 ?auto_5623 ?auto_5621 )
      ( DELIVER-2PKG-VERIFY ?auto_5622 ?auto_5623 ?auto_5621 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5629 - OBJ
      ?auto_5630 - OBJ
      ?auto_5628 - LOCATION
    )
    :vars
    (
      ?auto_5631 - TRUCK
      ?auto_5633 - LOCATION
      ?auto_5632 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5630 ?auto_5629 ) ) ( TRUCK-AT ?auto_5631 ?auto_5633 ) ( IN-CITY ?auto_5633 ?auto_5632 ) ( IN-CITY ?auto_5628 ?auto_5632 ) ( not ( = ?auto_5628 ?auto_5633 ) ) ( OBJ-AT ?auto_5630 ?auto_5628 ) ( OBJ-AT ?auto_5629 ?auto_5633 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5630 ?auto_5629 ?auto_5628 )
      ( DELIVER-2PKG-VERIFY ?auto_5629 ?auto_5630 ?auto_5628 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5635 - OBJ
      ?auto_5636 - OBJ
      ?auto_5634 - LOCATION
    )
    :vars
    (
      ?auto_5640 - OBJ
      ?auto_5637 - TRUCK
      ?auto_5639 - LOCATION
      ?auto_5638 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5636 ?auto_5635 ) ) ( not ( = ?auto_5635 ?auto_5640 ) ) ( TRUCK-AT ?auto_5637 ?auto_5639 ) ( IN-CITY ?auto_5639 ?auto_5638 ) ( IN-CITY ?auto_5634 ?auto_5638 ) ( not ( = ?auto_5634 ?auto_5639 ) ) ( OBJ-AT ?auto_5640 ?auto_5634 ) ( OBJ-AT ?auto_5635 ?auto_5639 ) ( OBJ-AT ?auto_5636 ?auto_5634 ) ( not ( = ?auto_5636 ?auto_5640 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5640 ?auto_5635 ?auto_5634 )
      ( DELIVER-2PKG-VERIFY ?auto_5635 ?auto_5636 ?auto_5634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5656 - OBJ
      ?auto_5657 - OBJ
      ?auto_5658 - OBJ
      ?auto_5655 - LOCATION
    )
    :vars
    (
      ?auto_5659 - TRUCK
      ?auto_5661 - LOCATION
      ?auto_5660 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5657 ?auto_5656 ) ) ( not ( = ?auto_5658 ?auto_5656 ) ) ( not ( = ?auto_5658 ?auto_5657 ) ) ( TRUCK-AT ?auto_5659 ?auto_5661 ) ( IN-CITY ?auto_5661 ?auto_5660 ) ( IN-CITY ?auto_5655 ?auto_5660 ) ( not ( = ?auto_5655 ?auto_5661 ) ) ( OBJ-AT ?auto_5656 ?auto_5655 ) ( OBJ-AT ?auto_5658 ?auto_5661 ) ( OBJ-AT ?auto_5657 ?auto_5655 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5656 ?auto_5658 ?auto_5655 )
      ( DELIVER-3PKG-VERIFY ?auto_5656 ?auto_5657 ?auto_5658 ?auto_5655 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5670 - OBJ
      ?auto_5671 - OBJ
      ?auto_5672 - OBJ
      ?auto_5669 - LOCATION
    )
    :vars
    (
      ?auto_5673 - TRUCK
      ?auto_5675 - LOCATION
      ?auto_5674 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5671 ?auto_5670 ) ) ( not ( = ?auto_5672 ?auto_5670 ) ) ( not ( = ?auto_5672 ?auto_5671 ) ) ( TRUCK-AT ?auto_5673 ?auto_5675 ) ( IN-CITY ?auto_5675 ?auto_5674 ) ( IN-CITY ?auto_5669 ?auto_5674 ) ( not ( = ?auto_5669 ?auto_5675 ) ) ( OBJ-AT ?auto_5670 ?auto_5669 ) ( OBJ-AT ?auto_5671 ?auto_5675 ) ( OBJ-AT ?auto_5672 ?auto_5669 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5670 ?auto_5671 ?auto_5669 )
      ( DELIVER-3PKG-VERIFY ?auto_5670 ?auto_5671 ?auto_5672 ?auto_5669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5684 - OBJ
      ?auto_5685 - OBJ
      ?auto_5686 - OBJ
      ?auto_5683 - LOCATION
    )
    :vars
    (
      ?auto_5687 - TRUCK
      ?auto_5689 - LOCATION
      ?auto_5688 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5685 ?auto_5684 ) ) ( not ( = ?auto_5686 ?auto_5684 ) ) ( not ( = ?auto_5686 ?auto_5685 ) ) ( TRUCK-AT ?auto_5687 ?auto_5689 ) ( IN-CITY ?auto_5689 ?auto_5688 ) ( IN-CITY ?auto_5683 ?auto_5688 ) ( not ( = ?auto_5683 ?auto_5689 ) ) ( OBJ-AT ?auto_5685 ?auto_5683 ) ( OBJ-AT ?auto_5686 ?auto_5689 ) ( OBJ-AT ?auto_5684 ?auto_5683 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5685 ?auto_5686 ?auto_5683 )
      ( DELIVER-3PKG-VERIFY ?auto_5684 ?auto_5685 ?auto_5686 ?auto_5683 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5699 - OBJ
      ?auto_5700 - OBJ
      ?auto_5701 - OBJ
      ?auto_5698 - LOCATION
    )
    :vars
    (
      ?auto_5702 - TRUCK
      ?auto_5704 - LOCATION
      ?auto_5703 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5700 ?auto_5699 ) ) ( not ( = ?auto_5701 ?auto_5699 ) ) ( not ( = ?auto_5701 ?auto_5700 ) ) ( TRUCK-AT ?auto_5702 ?auto_5704 ) ( IN-CITY ?auto_5704 ?auto_5703 ) ( IN-CITY ?auto_5698 ?auto_5703 ) ( not ( = ?auto_5698 ?auto_5704 ) ) ( OBJ-AT ?auto_5701 ?auto_5698 ) ( OBJ-AT ?auto_5700 ?auto_5704 ) ( OBJ-AT ?auto_5699 ?auto_5698 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5701 ?auto_5700 ?auto_5698 )
      ( DELIVER-3PKG-VERIFY ?auto_5699 ?auto_5700 ?auto_5701 ?auto_5698 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5729 - OBJ
      ?auto_5730 - OBJ
      ?auto_5731 - OBJ
      ?auto_5728 - LOCATION
    )
    :vars
    (
      ?auto_5732 - TRUCK
      ?auto_5734 - LOCATION
      ?auto_5733 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5730 ?auto_5729 ) ) ( not ( = ?auto_5731 ?auto_5729 ) ) ( not ( = ?auto_5731 ?auto_5730 ) ) ( TRUCK-AT ?auto_5732 ?auto_5734 ) ( IN-CITY ?auto_5734 ?auto_5733 ) ( IN-CITY ?auto_5728 ?auto_5733 ) ( not ( = ?auto_5728 ?auto_5734 ) ) ( OBJ-AT ?auto_5730 ?auto_5728 ) ( OBJ-AT ?auto_5729 ?auto_5734 ) ( OBJ-AT ?auto_5731 ?auto_5728 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5730 ?auto_5729 ?auto_5728 )
      ( DELIVER-3PKG-VERIFY ?auto_5729 ?auto_5730 ?auto_5731 ?auto_5728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5743 - OBJ
      ?auto_5744 - OBJ
      ?auto_5745 - OBJ
      ?auto_5742 - LOCATION
    )
    :vars
    (
      ?auto_5746 - TRUCK
      ?auto_5748 - LOCATION
      ?auto_5747 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_5744 ?auto_5743 ) ) ( not ( = ?auto_5745 ?auto_5743 ) ) ( not ( = ?auto_5745 ?auto_5744 ) ) ( TRUCK-AT ?auto_5746 ?auto_5748 ) ( IN-CITY ?auto_5748 ?auto_5747 ) ( IN-CITY ?auto_5742 ?auto_5747 ) ( not ( = ?auto_5742 ?auto_5748 ) ) ( OBJ-AT ?auto_5745 ?auto_5742 ) ( OBJ-AT ?auto_5743 ?auto_5748 ) ( OBJ-AT ?auto_5744 ?auto_5742 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5745 ?auto_5743 ?auto_5742 )
      ( DELIVER-3PKG-VERIFY ?auto_5743 ?auto_5744 ?auto_5745 ?auto_5742 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5789 - OBJ
      ?auto_5788 - LOCATION
    )
    :vars
    (
      ?auto_5793 - OBJ
      ?auto_5792 - LOCATION
      ?auto_5791 - CITY
      ?auto_5790 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5789 ?auto_5793 ) ) ( IN-CITY ?auto_5792 ?auto_5791 ) ( IN-CITY ?auto_5788 ?auto_5791 ) ( not ( = ?auto_5788 ?auto_5792 ) ) ( OBJ-AT ?auto_5793 ?auto_5788 ) ( OBJ-AT ?auto_5789 ?auto_5792 ) ( TRUCK-AT ?auto_5790 ?auto_5788 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5790 ?auto_5788 ?auto_5792 ?auto_5791 )
      ( DELIVER-2PKG ?auto_5793 ?auto_5789 ?auto_5788 )
      ( DELIVER-1PKG-VERIFY ?auto_5789 ?auto_5788 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5795 - OBJ
      ?auto_5796 - OBJ
      ?auto_5794 - LOCATION
    )
    :vars
    (
      ?auto_5797 - LOCATION
      ?auto_5798 - CITY
      ?auto_5799 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5796 ?auto_5795 ) ) ( IN-CITY ?auto_5797 ?auto_5798 ) ( IN-CITY ?auto_5794 ?auto_5798 ) ( not ( = ?auto_5794 ?auto_5797 ) ) ( OBJ-AT ?auto_5795 ?auto_5794 ) ( OBJ-AT ?auto_5796 ?auto_5797 ) ( TRUCK-AT ?auto_5799 ?auto_5794 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5796 ?auto_5794 )
      ( DELIVER-2PKG-VERIFY ?auto_5795 ?auto_5796 ?auto_5794 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5801 - OBJ
      ?auto_5802 - OBJ
      ?auto_5800 - LOCATION
    )
    :vars
    (
      ?auto_5805 - OBJ
      ?auto_5803 - LOCATION
      ?auto_5806 - CITY
      ?auto_5804 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5802 ?auto_5801 ) ) ( not ( = ?auto_5802 ?auto_5805 ) ) ( IN-CITY ?auto_5803 ?auto_5806 ) ( IN-CITY ?auto_5800 ?auto_5806 ) ( not ( = ?auto_5800 ?auto_5803 ) ) ( OBJ-AT ?auto_5805 ?auto_5800 ) ( OBJ-AT ?auto_5802 ?auto_5803 ) ( TRUCK-AT ?auto_5804 ?auto_5800 ) ( OBJ-AT ?auto_5801 ?auto_5800 ) ( not ( = ?auto_5801 ?auto_5805 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5805 ?auto_5802 ?auto_5800 )
      ( DELIVER-2PKG-VERIFY ?auto_5801 ?auto_5802 ?auto_5800 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5808 - OBJ
      ?auto_5809 - OBJ
      ?auto_5807 - LOCATION
    )
    :vars
    (
      ?auto_5810 - LOCATION
      ?auto_5812 - CITY
      ?auto_5811 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5809 ?auto_5808 ) ) ( IN-CITY ?auto_5810 ?auto_5812 ) ( IN-CITY ?auto_5807 ?auto_5812 ) ( not ( = ?auto_5807 ?auto_5810 ) ) ( OBJ-AT ?auto_5809 ?auto_5807 ) ( OBJ-AT ?auto_5808 ?auto_5810 ) ( TRUCK-AT ?auto_5811 ?auto_5807 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5809 ?auto_5808 ?auto_5807 )
      ( DELIVER-2PKG-VERIFY ?auto_5808 ?auto_5809 ?auto_5807 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5814 - OBJ
      ?auto_5815 - OBJ
      ?auto_5813 - LOCATION
    )
    :vars
    (
      ?auto_5818 - OBJ
      ?auto_5816 - LOCATION
      ?auto_5819 - CITY
      ?auto_5817 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5815 ?auto_5814 ) ) ( not ( = ?auto_5814 ?auto_5818 ) ) ( IN-CITY ?auto_5816 ?auto_5819 ) ( IN-CITY ?auto_5813 ?auto_5819 ) ( not ( = ?auto_5813 ?auto_5816 ) ) ( OBJ-AT ?auto_5818 ?auto_5813 ) ( OBJ-AT ?auto_5814 ?auto_5816 ) ( TRUCK-AT ?auto_5817 ?auto_5813 ) ( OBJ-AT ?auto_5815 ?auto_5813 ) ( not ( = ?auto_5815 ?auto_5818 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5818 ?auto_5814 ?auto_5813 )
      ( DELIVER-2PKG-VERIFY ?auto_5814 ?auto_5815 ?auto_5813 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5835 - OBJ
      ?auto_5836 - OBJ
      ?auto_5837 - OBJ
      ?auto_5834 - LOCATION
    )
    :vars
    (
      ?auto_5838 - LOCATION
      ?auto_5840 - CITY
      ?auto_5839 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5836 ?auto_5835 ) ) ( not ( = ?auto_5837 ?auto_5835 ) ) ( not ( = ?auto_5837 ?auto_5836 ) ) ( IN-CITY ?auto_5838 ?auto_5840 ) ( IN-CITY ?auto_5834 ?auto_5840 ) ( not ( = ?auto_5834 ?auto_5838 ) ) ( OBJ-AT ?auto_5835 ?auto_5834 ) ( OBJ-AT ?auto_5837 ?auto_5838 ) ( TRUCK-AT ?auto_5839 ?auto_5834 ) ( OBJ-AT ?auto_5836 ?auto_5834 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5835 ?auto_5837 ?auto_5834 )
      ( DELIVER-3PKG-VERIFY ?auto_5835 ?auto_5836 ?auto_5837 ?auto_5834 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5849 - OBJ
      ?auto_5850 - OBJ
      ?auto_5851 - OBJ
      ?auto_5848 - LOCATION
    )
    :vars
    (
      ?auto_5852 - LOCATION
      ?auto_5854 - CITY
      ?auto_5853 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5850 ?auto_5849 ) ) ( not ( = ?auto_5851 ?auto_5849 ) ) ( not ( = ?auto_5851 ?auto_5850 ) ) ( IN-CITY ?auto_5852 ?auto_5854 ) ( IN-CITY ?auto_5848 ?auto_5854 ) ( not ( = ?auto_5848 ?auto_5852 ) ) ( OBJ-AT ?auto_5849 ?auto_5848 ) ( OBJ-AT ?auto_5850 ?auto_5852 ) ( TRUCK-AT ?auto_5853 ?auto_5848 ) ( OBJ-AT ?auto_5851 ?auto_5848 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5849 ?auto_5850 ?auto_5848 )
      ( DELIVER-3PKG-VERIFY ?auto_5849 ?auto_5850 ?auto_5851 ?auto_5848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5863 - OBJ
      ?auto_5864 - OBJ
      ?auto_5865 - OBJ
      ?auto_5862 - LOCATION
    )
    :vars
    (
      ?auto_5866 - LOCATION
      ?auto_5868 - CITY
      ?auto_5867 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5864 ?auto_5863 ) ) ( not ( = ?auto_5865 ?auto_5863 ) ) ( not ( = ?auto_5865 ?auto_5864 ) ) ( IN-CITY ?auto_5866 ?auto_5868 ) ( IN-CITY ?auto_5862 ?auto_5868 ) ( not ( = ?auto_5862 ?auto_5866 ) ) ( OBJ-AT ?auto_5864 ?auto_5862 ) ( OBJ-AT ?auto_5865 ?auto_5866 ) ( TRUCK-AT ?auto_5867 ?auto_5862 ) ( OBJ-AT ?auto_5863 ?auto_5862 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5864 ?auto_5865 ?auto_5862 )
      ( DELIVER-3PKG-VERIFY ?auto_5863 ?auto_5864 ?auto_5865 ?auto_5862 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5878 - OBJ
      ?auto_5879 - OBJ
      ?auto_5880 - OBJ
      ?auto_5877 - LOCATION
    )
    :vars
    (
      ?auto_5881 - LOCATION
      ?auto_5883 - CITY
      ?auto_5882 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5879 ?auto_5878 ) ) ( not ( = ?auto_5880 ?auto_5878 ) ) ( not ( = ?auto_5880 ?auto_5879 ) ) ( IN-CITY ?auto_5881 ?auto_5883 ) ( IN-CITY ?auto_5877 ?auto_5883 ) ( not ( = ?auto_5877 ?auto_5881 ) ) ( OBJ-AT ?auto_5880 ?auto_5877 ) ( OBJ-AT ?auto_5879 ?auto_5881 ) ( TRUCK-AT ?auto_5882 ?auto_5877 ) ( OBJ-AT ?auto_5878 ?auto_5877 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5880 ?auto_5879 ?auto_5877 )
      ( DELIVER-3PKG-VERIFY ?auto_5878 ?auto_5879 ?auto_5880 ?auto_5877 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5908 - OBJ
      ?auto_5909 - OBJ
      ?auto_5910 - OBJ
      ?auto_5907 - LOCATION
    )
    :vars
    (
      ?auto_5911 - LOCATION
      ?auto_5913 - CITY
      ?auto_5912 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5909 ?auto_5908 ) ) ( not ( = ?auto_5910 ?auto_5908 ) ) ( not ( = ?auto_5910 ?auto_5909 ) ) ( IN-CITY ?auto_5911 ?auto_5913 ) ( IN-CITY ?auto_5907 ?auto_5913 ) ( not ( = ?auto_5907 ?auto_5911 ) ) ( OBJ-AT ?auto_5909 ?auto_5907 ) ( OBJ-AT ?auto_5908 ?auto_5911 ) ( TRUCK-AT ?auto_5912 ?auto_5907 ) ( OBJ-AT ?auto_5910 ?auto_5907 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5909 ?auto_5908 ?auto_5907 )
      ( DELIVER-3PKG-VERIFY ?auto_5908 ?auto_5909 ?auto_5910 ?auto_5907 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5922 - OBJ
      ?auto_5923 - OBJ
      ?auto_5924 - OBJ
      ?auto_5921 - LOCATION
    )
    :vars
    (
      ?auto_5925 - LOCATION
      ?auto_5927 - CITY
      ?auto_5926 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5923 ?auto_5922 ) ) ( not ( = ?auto_5924 ?auto_5922 ) ) ( not ( = ?auto_5924 ?auto_5923 ) ) ( IN-CITY ?auto_5925 ?auto_5927 ) ( IN-CITY ?auto_5921 ?auto_5927 ) ( not ( = ?auto_5921 ?auto_5925 ) ) ( OBJ-AT ?auto_5924 ?auto_5921 ) ( OBJ-AT ?auto_5922 ?auto_5925 ) ( TRUCK-AT ?auto_5926 ?auto_5921 ) ( OBJ-AT ?auto_5923 ?auto_5921 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5924 ?auto_5922 ?auto_5921 )
      ( DELIVER-3PKG-VERIFY ?auto_5922 ?auto_5923 ?auto_5924 ?auto_5921 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5968 - OBJ
      ?auto_5967 - LOCATION
    )
    :vars
    (
      ?auto_5971 - OBJ
      ?auto_5969 - LOCATION
      ?auto_5972 - CITY
      ?auto_5970 - TRUCK
      ?auto_5973 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_5968 ?auto_5971 ) ) ( IN-CITY ?auto_5969 ?auto_5972 ) ( IN-CITY ?auto_5967 ?auto_5972 ) ( not ( = ?auto_5967 ?auto_5969 ) ) ( OBJ-AT ?auto_5971 ?auto_5967 ) ( OBJ-AT ?auto_5968 ?auto_5969 ) ( TRUCK-AT ?auto_5970 ?auto_5967 ) ( not ( = ?auto_5973 ?auto_5971 ) ) ( IN-TRUCK ?auto_5973 ?auto_5970 ) ( not ( = ?auto_5968 ?auto_5973 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5971 ?auto_5973 ?auto_5967 )
      ( DELIVER-2PKG ?auto_5971 ?auto_5968 ?auto_5967 )
      ( DELIVER-1PKG-VERIFY ?auto_5968 ?auto_5967 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5975 - OBJ
      ?auto_5976 - OBJ
      ?auto_5974 - LOCATION
    )
    :vars
    (
      ?auto_5980 - LOCATION
      ?auto_5977 - CITY
      ?auto_5978 - TRUCK
      ?auto_5979 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_5976 ?auto_5975 ) ) ( IN-CITY ?auto_5980 ?auto_5977 ) ( IN-CITY ?auto_5974 ?auto_5977 ) ( not ( = ?auto_5974 ?auto_5980 ) ) ( OBJ-AT ?auto_5975 ?auto_5974 ) ( OBJ-AT ?auto_5976 ?auto_5980 ) ( TRUCK-AT ?auto_5978 ?auto_5974 ) ( not ( = ?auto_5979 ?auto_5975 ) ) ( IN-TRUCK ?auto_5979 ?auto_5978 ) ( not ( = ?auto_5976 ?auto_5979 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5976 ?auto_5974 )
      ( DELIVER-2PKG-VERIFY ?auto_5975 ?auto_5976 ?auto_5974 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5982 - OBJ
      ?auto_5983 - OBJ
      ?auto_5981 - LOCATION
    )
    :vars
    (
      ?auto_5987 - OBJ
      ?auto_5984 - LOCATION
      ?auto_5986 - CITY
      ?auto_5985 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5983 ?auto_5982 ) ) ( not ( = ?auto_5983 ?auto_5987 ) ) ( IN-CITY ?auto_5984 ?auto_5986 ) ( IN-CITY ?auto_5981 ?auto_5986 ) ( not ( = ?auto_5981 ?auto_5984 ) ) ( OBJ-AT ?auto_5987 ?auto_5981 ) ( OBJ-AT ?auto_5983 ?auto_5984 ) ( TRUCK-AT ?auto_5985 ?auto_5981 ) ( not ( = ?auto_5982 ?auto_5987 ) ) ( IN-TRUCK ?auto_5982 ?auto_5985 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5987 ?auto_5983 ?auto_5981 )
      ( DELIVER-2PKG-VERIFY ?auto_5982 ?auto_5983 ?auto_5981 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5989 - OBJ
      ?auto_5990 - OBJ
      ?auto_5988 - LOCATION
    )
    :vars
    (
      ?auto_5991 - LOCATION
      ?auto_5993 - CITY
      ?auto_5992 - TRUCK
      ?auto_5994 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_5990 ?auto_5989 ) ) ( IN-CITY ?auto_5991 ?auto_5993 ) ( IN-CITY ?auto_5988 ?auto_5993 ) ( not ( = ?auto_5988 ?auto_5991 ) ) ( OBJ-AT ?auto_5990 ?auto_5988 ) ( OBJ-AT ?auto_5989 ?auto_5991 ) ( TRUCK-AT ?auto_5992 ?auto_5988 ) ( not ( = ?auto_5994 ?auto_5990 ) ) ( IN-TRUCK ?auto_5994 ?auto_5992 ) ( not ( = ?auto_5989 ?auto_5994 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5990 ?auto_5989 ?auto_5988 )
      ( DELIVER-2PKG-VERIFY ?auto_5989 ?auto_5990 ?auto_5988 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5996 - OBJ
      ?auto_5997 - OBJ
      ?auto_5995 - LOCATION
    )
    :vars
    (
      ?auto_6001 - OBJ
      ?auto_5998 - LOCATION
      ?auto_6000 - CITY
      ?auto_5999 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_5997 ?auto_5996 ) ) ( not ( = ?auto_5996 ?auto_6001 ) ) ( IN-CITY ?auto_5998 ?auto_6000 ) ( IN-CITY ?auto_5995 ?auto_6000 ) ( not ( = ?auto_5995 ?auto_5998 ) ) ( OBJ-AT ?auto_6001 ?auto_5995 ) ( OBJ-AT ?auto_5996 ?auto_5998 ) ( TRUCK-AT ?auto_5999 ?auto_5995 ) ( not ( = ?auto_5997 ?auto_6001 ) ) ( IN-TRUCK ?auto_5997 ?auto_5999 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6001 ?auto_5996 ?auto_5995 )
      ( DELIVER-2PKG-VERIFY ?auto_5996 ?auto_5997 ?auto_5995 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6019 - OBJ
      ?auto_6020 - OBJ
      ?auto_6021 - OBJ
      ?auto_6018 - LOCATION
    )
    :vars
    (
      ?auto_6022 - LOCATION
      ?auto_6024 - CITY
      ?auto_6023 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6020 ?auto_6019 ) ) ( not ( = ?auto_6021 ?auto_6019 ) ) ( not ( = ?auto_6021 ?auto_6020 ) ) ( IN-CITY ?auto_6022 ?auto_6024 ) ( IN-CITY ?auto_6018 ?auto_6024 ) ( not ( = ?auto_6018 ?auto_6022 ) ) ( OBJ-AT ?auto_6019 ?auto_6018 ) ( OBJ-AT ?auto_6021 ?auto_6022 ) ( TRUCK-AT ?auto_6023 ?auto_6018 ) ( IN-TRUCK ?auto_6020 ?auto_6023 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6019 ?auto_6021 ?auto_6018 )
      ( DELIVER-3PKG-VERIFY ?auto_6019 ?auto_6020 ?auto_6021 ?auto_6018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6034 - OBJ
      ?auto_6035 - OBJ
      ?auto_6036 - OBJ
      ?auto_6033 - LOCATION
    )
    :vars
    (
      ?auto_6037 - LOCATION
      ?auto_6039 - CITY
      ?auto_6038 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6035 ?auto_6034 ) ) ( not ( = ?auto_6036 ?auto_6034 ) ) ( not ( = ?auto_6036 ?auto_6035 ) ) ( IN-CITY ?auto_6037 ?auto_6039 ) ( IN-CITY ?auto_6033 ?auto_6039 ) ( not ( = ?auto_6033 ?auto_6037 ) ) ( OBJ-AT ?auto_6034 ?auto_6033 ) ( OBJ-AT ?auto_6035 ?auto_6037 ) ( TRUCK-AT ?auto_6038 ?auto_6033 ) ( IN-TRUCK ?auto_6036 ?auto_6038 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6034 ?auto_6035 ?auto_6033 )
      ( DELIVER-3PKG-VERIFY ?auto_6034 ?auto_6035 ?auto_6036 ?auto_6033 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6049 - OBJ
      ?auto_6050 - OBJ
      ?auto_6051 - OBJ
      ?auto_6048 - LOCATION
    )
    :vars
    (
      ?auto_6052 - LOCATION
      ?auto_6054 - CITY
      ?auto_6053 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6050 ?auto_6049 ) ) ( not ( = ?auto_6051 ?auto_6049 ) ) ( not ( = ?auto_6051 ?auto_6050 ) ) ( IN-CITY ?auto_6052 ?auto_6054 ) ( IN-CITY ?auto_6048 ?auto_6054 ) ( not ( = ?auto_6048 ?auto_6052 ) ) ( OBJ-AT ?auto_6050 ?auto_6048 ) ( OBJ-AT ?auto_6051 ?auto_6052 ) ( TRUCK-AT ?auto_6053 ?auto_6048 ) ( IN-TRUCK ?auto_6049 ?auto_6053 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6050 ?auto_6051 ?auto_6048 )
      ( DELIVER-3PKG-VERIFY ?auto_6049 ?auto_6050 ?auto_6051 ?auto_6048 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6064 - OBJ
      ?auto_6065 - OBJ
      ?auto_6066 - OBJ
      ?auto_6063 - LOCATION
    )
    :vars
    (
      ?auto_6067 - LOCATION
      ?auto_6069 - CITY
      ?auto_6068 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6065 ?auto_6064 ) ) ( not ( = ?auto_6066 ?auto_6064 ) ) ( not ( = ?auto_6066 ?auto_6065 ) ) ( IN-CITY ?auto_6067 ?auto_6069 ) ( IN-CITY ?auto_6063 ?auto_6069 ) ( not ( = ?auto_6063 ?auto_6067 ) ) ( OBJ-AT ?auto_6066 ?auto_6063 ) ( OBJ-AT ?auto_6065 ?auto_6067 ) ( TRUCK-AT ?auto_6068 ?auto_6063 ) ( IN-TRUCK ?auto_6064 ?auto_6068 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6066 ?auto_6065 ?auto_6063 )
      ( DELIVER-3PKG-VERIFY ?auto_6064 ?auto_6065 ?auto_6066 ?auto_6063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6095 - OBJ
      ?auto_6096 - OBJ
      ?auto_6097 - OBJ
      ?auto_6094 - LOCATION
    )
    :vars
    (
      ?auto_6098 - LOCATION
      ?auto_6100 - CITY
      ?auto_6099 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6096 ?auto_6095 ) ) ( not ( = ?auto_6097 ?auto_6095 ) ) ( not ( = ?auto_6097 ?auto_6096 ) ) ( IN-CITY ?auto_6098 ?auto_6100 ) ( IN-CITY ?auto_6094 ?auto_6100 ) ( not ( = ?auto_6094 ?auto_6098 ) ) ( OBJ-AT ?auto_6096 ?auto_6094 ) ( OBJ-AT ?auto_6095 ?auto_6098 ) ( TRUCK-AT ?auto_6099 ?auto_6094 ) ( IN-TRUCK ?auto_6097 ?auto_6099 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6096 ?auto_6095 ?auto_6094 )
      ( DELIVER-3PKG-VERIFY ?auto_6095 ?auto_6096 ?auto_6097 ?auto_6094 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6110 - OBJ
      ?auto_6111 - OBJ
      ?auto_6112 - OBJ
      ?auto_6109 - LOCATION
    )
    :vars
    (
      ?auto_6113 - LOCATION
      ?auto_6115 - CITY
      ?auto_6114 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6111 ?auto_6110 ) ) ( not ( = ?auto_6112 ?auto_6110 ) ) ( not ( = ?auto_6112 ?auto_6111 ) ) ( IN-CITY ?auto_6113 ?auto_6115 ) ( IN-CITY ?auto_6109 ?auto_6115 ) ( not ( = ?auto_6109 ?auto_6113 ) ) ( OBJ-AT ?auto_6112 ?auto_6109 ) ( OBJ-AT ?auto_6110 ?auto_6113 ) ( TRUCK-AT ?auto_6114 ?auto_6109 ) ( IN-TRUCK ?auto_6111 ?auto_6114 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6112 ?auto_6110 ?auto_6109 )
      ( DELIVER-3PKG-VERIFY ?auto_6110 ?auto_6111 ?auto_6112 ?auto_6109 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6158 - OBJ
      ?auto_6157 - LOCATION
    )
    :vars
    (
      ?auto_6163 - OBJ
      ?auto_6159 - LOCATION
      ?auto_6161 - CITY
      ?auto_6162 - OBJ
      ?auto_6160 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6158 ?auto_6163 ) ) ( IN-CITY ?auto_6159 ?auto_6161 ) ( IN-CITY ?auto_6157 ?auto_6161 ) ( not ( = ?auto_6157 ?auto_6159 ) ) ( OBJ-AT ?auto_6163 ?auto_6157 ) ( OBJ-AT ?auto_6158 ?auto_6159 ) ( not ( = ?auto_6162 ?auto_6163 ) ) ( IN-TRUCK ?auto_6162 ?auto_6160 ) ( not ( = ?auto_6158 ?auto_6162 ) ) ( TRUCK-AT ?auto_6160 ?auto_6159 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6160 ?auto_6159 ?auto_6157 ?auto_6161 )
      ( DELIVER-2PKG ?auto_6163 ?auto_6158 ?auto_6157 )
      ( DELIVER-1PKG-VERIFY ?auto_6158 ?auto_6157 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6165 - OBJ
      ?auto_6166 - OBJ
      ?auto_6164 - LOCATION
    )
    :vars
    (
      ?auto_6170 - LOCATION
      ?auto_6169 - CITY
      ?auto_6168 - OBJ
      ?auto_6167 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6166 ?auto_6165 ) ) ( IN-CITY ?auto_6170 ?auto_6169 ) ( IN-CITY ?auto_6164 ?auto_6169 ) ( not ( = ?auto_6164 ?auto_6170 ) ) ( OBJ-AT ?auto_6165 ?auto_6164 ) ( OBJ-AT ?auto_6166 ?auto_6170 ) ( not ( = ?auto_6168 ?auto_6165 ) ) ( IN-TRUCK ?auto_6168 ?auto_6167 ) ( not ( = ?auto_6166 ?auto_6168 ) ) ( TRUCK-AT ?auto_6167 ?auto_6170 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6166 ?auto_6164 )
      ( DELIVER-2PKG-VERIFY ?auto_6165 ?auto_6166 ?auto_6164 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6172 - OBJ
      ?auto_6173 - OBJ
      ?auto_6171 - LOCATION
    )
    :vars
    (
      ?auto_6175 - OBJ
      ?auto_6177 - LOCATION
      ?auto_6174 - CITY
      ?auto_6176 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6173 ?auto_6172 ) ) ( not ( = ?auto_6173 ?auto_6175 ) ) ( IN-CITY ?auto_6177 ?auto_6174 ) ( IN-CITY ?auto_6171 ?auto_6174 ) ( not ( = ?auto_6171 ?auto_6177 ) ) ( OBJ-AT ?auto_6175 ?auto_6171 ) ( OBJ-AT ?auto_6173 ?auto_6177 ) ( not ( = ?auto_6172 ?auto_6175 ) ) ( IN-TRUCK ?auto_6172 ?auto_6176 ) ( TRUCK-AT ?auto_6176 ?auto_6177 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6175 ?auto_6173 ?auto_6171 )
      ( DELIVER-2PKG-VERIFY ?auto_6172 ?auto_6173 ?auto_6171 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6179 - OBJ
      ?auto_6180 - OBJ
      ?auto_6178 - LOCATION
    )
    :vars
    (
      ?auto_6184 - LOCATION
      ?auto_6181 - CITY
      ?auto_6183 - OBJ
      ?auto_6182 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6180 ?auto_6179 ) ) ( IN-CITY ?auto_6184 ?auto_6181 ) ( IN-CITY ?auto_6178 ?auto_6181 ) ( not ( = ?auto_6178 ?auto_6184 ) ) ( OBJ-AT ?auto_6180 ?auto_6178 ) ( OBJ-AT ?auto_6179 ?auto_6184 ) ( not ( = ?auto_6183 ?auto_6180 ) ) ( IN-TRUCK ?auto_6183 ?auto_6182 ) ( not ( = ?auto_6179 ?auto_6183 ) ) ( TRUCK-AT ?auto_6182 ?auto_6184 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6180 ?auto_6179 ?auto_6178 )
      ( DELIVER-2PKG-VERIFY ?auto_6179 ?auto_6180 ?auto_6178 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6186 - OBJ
      ?auto_6187 - OBJ
      ?auto_6185 - LOCATION
    )
    :vars
    (
      ?auto_6189 - OBJ
      ?auto_6191 - LOCATION
      ?auto_6188 - CITY
      ?auto_6190 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6187 ?auto_6186 ) ) ( not ( = ?auto_6186 ?auto_6189 ) ) ( IN-CITY ?auto_6191 ?auto_6188 ) ( IN-CITY ?auto_6185 ?auto_6188 ) ( not ( = ?auto_6185 ?auto_6191 ) ) ( OBJ-AT ?auto_6189 ?auto_6185 ) ( OBJ-AT ?auto_6186 ?auto_6191 ) ( not ( = ?auto_6187 ?auto_6189 ) ) ( IN-TRUCK ?auto_6187 ?auto_6190 ) ( TRUCK-AT ?auto_6190 ?auto_6191 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6189 ?auto_6186 ?auto_6185 )
      ( DELIVER-2PKG-VERIFY ?auto_6186 ?auto_6187 ?auto_6185 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6209 - OBJ
      ?auto_6210 - OBJ
      ?auto_6211 - OBJ
      ?auto_6208 - LOCATION
    )
    :vars
    (
      ?auto_6214 - LOCATION
      ?auto_6212 - CITY
      ?auto_6213 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6210 ?auto_6209 ) ) ( not ( = ?auto_6211 ?auto_6209 ) ) ( not ( = ?auto_6211 ?auto_6210 ) ) ( IN-CITY ?auto_6214 ?auto_6212 ) ( IN-CITY ?auto_6208 ?auto_6212 ) ( not ( = ?auto_6208 ?auto_6214 ) ) ( OBJ-AT ?auto_6209 ?auto_6208 ) ( OBJ-AT ?auto_6211 ?auto_6214 ) ( IN-TRUCK ?auto_6210 ?auto_6213 ) ( TRUCK-AT ?auto_6213 ?auto_6214 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6209 ?auto_6211 ?auto_6208 )
      ( DELIVER-3PKG-VERIFY ?auto_6209 ?auto_6210 ?auto_6211 ?auto_6208 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6224 - OBJ
      ?auto_6225 - OBJ
      ?auto_6226 - OBJ
      ?auto_6223 - LOCATION
    )
    :vars
    (
      ?auto_6229 - LOCATION
      ?auto_6227 - CITY
      ?auto_6228 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6225 ?auto_6224 ) ) ( not ( = ?auto_6226 ?auto_6224 ) ) ( not ( = ?auto_6226 ?auto_6225 ) ) ( IN-CITY ?auto_6229 ?auto_6227 ) ( IN-CITY ?auto_6223 ?auto_6227 ) ( not ( = ?auto_6223 ?auto_6229 ) ) ( OBJ-AT ?auto_6224 ?auto_6223 ) ( OBJ-AT ?auto_6225 ?auto_6229 ) ( IN-TRUCK ?auto_6226 ?auto_6228 ) ( TRUCK-AT ?auto_6228 ?auto_6229 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6224 ?auto_6225 ?auto_6223 )
      ( DELIVER-3PKG-VERIFY ?auto_6224 ?auto_6225 ?auto_6226 ?auto_6223 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6239 - OBJ
      ?auto_6240 - OBJ
      ?auto_6241 - OBJ
      ?auto_6238 - LOCATION
    )
    :vars
    (
      ?auto_6244 - LOCATION
      ?auto_6242 - CITY
      ?auto_6243 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6240 ?auto_6239 ) ) ( not ( = ?auto_6241 ?auto_6239 ) ) ( not ( = ?auto_6241 ?auto_6240 ) ) ( IN-CITY ?auto_6244 ?auto_6242 ) ( IN-CITY ?auto_6238 ?auto_6242 ) ( not ( = ?auto_6238 ?auto_6244 ) ) ( OBJ-AT ?auto_6240 ?auto_6238 ) ( OBJ-AT ?auto_6241 ?auto_6244 ) ( IN-TRUCK ?auto_6239 ?auto_6243 ) ( TRUCK-AT ?auto_6243 ?auto_6244 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6240 ?auto_6241 ?auto_6238 )
      ( DELIVER-3PKG-VERIFY ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6238 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6254 - OBJ
      ?auto_6255 - OBJ
      ?auto_6256 - OBJ
      ?auto_6253 - LOCATION
    )
    :vars
    (
      ?auto_6259 - LOCATION
      ?auto_6257 - CITY
      ?auto_6258 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6255 ?auto_6254 ) ) ( not ( = ?auto_6256 ?auto_6254 ) ) ( not ( = ?auto_6256 ?auto_6255 ) ) ( IN-CITY ?auto_6259 ?auto_6257 ) ( IN-CITY ?auto_6253 ?auto_6257 ) ( not ( = ?auto_6253 ?auto_6259 ) ) ( OBJ-AT ?auto_6256 ?auto_6253 ) ( OBJ-AT ?auto_6255 ?auto_6259 ) ( IN-TRUCK ?auto_6254 ?auto_6258 ) ( TRUCK-AT ?auto_6258 ?auto_6259 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6256 ?auto_6255 ?auto_6253 )
      ( DELIVER-3PKG-VERIFY ?auto_6254 ?auto_6255 ?auto_6256 ?auto_6253 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6285 - OBJ
      ?auto_6286 - OBJ
      ?auto_6287 - OBJ
      ?auto_6284 - LOCATION
    )
    :vars
    (
      ?auto_6290 - LOCATION
      ?auto_6288 - CITY
      ?auto_6289 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6286 ?auto_6285 ) ) ( not ( = ?auto_6287 ?auto_6285 ) ) ( not ( = ?auto_6287 ?auto_6286 ) ) ( IN-CITY ?auto_6290 ?auto_6288 ) ( IN-CITY ?auto_6284 ?auto_6288 ) ( not ( = ?auto_6284 ?auto_6290 ) ) ( OBJ-AT ?auto_6286 ?auto_6284 ) ( OBJ-AT ?auto_6285 ?auto_6290 ) ( IN-TRUCK ?auto_6287 ?auto_6289 ) ( TRUCK-AT ?auto_6289 ?auto_6290 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6286 ?auto_6285 ?auto_6284 )
      ( DELIVER-3PKG-VERIFY ?auto_6285 ?auto_6286 ?auto_6287 ?auto_6284 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6300 - OBJ
      ?auto_6301 - OBJ
      ?auto_6302 - OBJ
      ?auto_6299 - LOCATION
    )
    :vars
    (
      ?auto_6305 - LOCATION
      ?auto_6303 - CITY
      ?auto_6304 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6301 ?auto_6300 ) ) ( not ( = ?auto_6302 ?auto_6300 ) ) ( not ( = ?auto_6302 ?auto_6301 ) ) ( IN-CITY ?auto_6305 ?auto_6303 ) ( IN-CITY ?auto_6299 ?auto_6303 ) ( not ( = ?auto_6299 ?auto_6305 ) ) ( OBJ-AT ?auto_6302 ?auto_6299 ) ( OBJ-AT ?auto_6300 ?auto_6305 ) ( IN-TRUCK ?auto_6301 ?auto_6304 ) ( TRUCK-AT ?auto_6304 ?auto_6305 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6302 ?auto_6300 ?auto_6299 )
      ( DELIVER-3PKG-VERIFY ?auto_6300 ?auto_6301 ?auto_6302 ?auto_6299 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6348 - OBJ
      ?auto_6347 - LOCATION
    )
    :vars
    (
      ?auto_6350 - OBJ
      ?auto_6353 - LOCATION
      ?auto_6349 - CITY
      ?auto_6352 - OBJ
      ?auto_6351 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6348 ?auto_6350 ) ) ( IN-CITY ?auto_6353 ?auto_6349 ) ( IN-CITY ?auto_6347 ?auto_6349 ) ( not ( = ?auto_6347 ?auto_6353 ) ) ( OBJ-AT ?auto_6350 ?auto_6347 ) ( OBJ-AT ?auto_6348 ?auto_6353 ) ( not ( = ?auto_6352 ?auto_6350 ) ) ( not ( = ?auto_6348 ?auto_6352 ) ) ( TRUCK-AT ?auto_6351 ?auto_6353 ) ( OBJ-AT ?auto_6352 ?auto_6353 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6352 ?auto_6351 ?auto_6353 )
      ( DELIVER-2PKG ?auto_6350 ?auto_6348 ?auto_6347 )
      ( DELIVER-1PKG-VERIFY ?auto_6348 ?auto_6347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6355 - OBJ
      ?auto_6356 - OBJ
      ?auto_6354 - LOCATION
    )
    :vars
    (
      ?auto_6359 - LOCATION
      ?auto_6360 - CITY
      ?auto_6357 - OBJ
      ?auto_6358 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6356 ?auto_6355 ) ) ( IN-CITY ?auto_6359 ?auto_6360 ) ( IN-CITY ?auto_6354 ?auto_6360 ) ( not ( = ?auto_6354 ?auto_6359 ) ) ( OBJ-AT ?auto_6355 ?auto_6354 ) ( OBJ-AT ?auto_6356 ?auto_6359 ) ( not ( = ?auto_6357 ?auto_6355 ) ) ( not ( = ?auto_6356 ?auto_6357 ) ) ( TRUCK-AT ?auto_6358 ?auto_6359 ) ( OBJ-AT ?auto_6357 ?auto_6359 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6356 ?auto_6354 )
      ( DELIVER-2PKG-VERIFY ?auto_6355 ?auto_6356 ?auto_6354 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6362 - OBJ
      ?auto_6363 - OBJ
      ?auto_6361 - LOCATION
    )
    :vars
    (
      ?auto_6365 - OBJ
      ?auto_6367 - LOCATION
      ?auto_6364 - CITY
      ?auto_6366 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6363 ?auto_6362 ) ) ( not ( = ?auto_6363 ?auto_6365 ) ) ( IN-CITY ?auto_6367 ?auto_6364 ) ( IN-CITY ?auto_6361 ?auto_6364 ) ( not ( = ?auto_6361 ?auto_6367 ) ) ( OBJ-AT ?auto_6365 ?auto_6361 ) ( OBJ-AT ?auto_6363 ?auto_6367 ) ( not ( = ?auto_6362 ?auto_6365 ) ) ( TRUCK-AT ?auto_6366 ?auto_6367 ) ( OBJ-AT ?auto_6362 ?auto_6367 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6365 ?auto_6363 ?auto_6361 )
      ( DELIVER-2PKG-VERIFY ?auto_6362 ?auto_6363 ?auto_6361 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6369 - OBJ
      ?auto_6370 - OBJ
      ?auto_6368 - LOCATION
    )
    :vars
    (
      ?auto_6373 - LOCATION
      ?auto_6371 - CITY
      ?auto_6374 - OBJ
      ?auto_6372 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6370 ?auto_6369 ) ) ( IN-CITY ?auto_6373 ?auto_6371 ) ( IN-CITY ?auto_6368 ?auto_6371 ) ( not ( = ?auto_6368 ?auto_6373 ) ) ( OBJ-AT ?auto_6370 ?auto_6368 ) ( OBJ-AT ?auto_6369 ?auto_6373 ) ( not ( = ?auto_6374 ?auto_6370 ) ) ( not ( = ?auto_6369 ?auto_6374 ) ) ( TRUCK-AT ?auto_6372 ?auto_6373 ) ( OBJ-AT ?auto_6374 ?auto_6373 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6370 ?auto_6369 ?auto_6368 )
      ( DELIVER-2PKG-VERIFY ?auto_6369 ?auto_6370 ?auto_6368 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6376 - OBJ
      ?auto_6377 - OBJ
      ?auto_6375 - LOCATION
    )
    :vars
    (
      ?auto_6379 - OBJ
      ?auto_6381 - LOCATION
      ?auto_6378 - CITY
      ?auto_6380 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6377 ?auto_6376 ) ) ( not ( = ?auto_6376 ?auto_6379 ) ) ( IN-CITY ?auto_6381 ?auto_6378 ) ( IN-CITY ?auto_6375 ?auto_6378 ) ( not ( = ?auto_6375 ?auto_6381 ) ) ( OBJ-AT ?auto_6379 ?auto_6375 ) ( OBJ-AT ?auto_6376 ?auto_6381 ) ( not ( = ?auto_6377 ?auto_6379 ) ) ( TRUCK-AT ?auto_6380 ?auto_6381 ) ( OBJ-AT ?auto_6377 ?auto_6381 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6379 ?auto_6376 ?auto_6375 )
      ( DELIVER-2PKG-VERIFY ?auto_6376 ?auto_6377 ?auto_6375 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6399 - OBJ
      ?auto_6400 - OBJ
      ?auto_6401 - OBJ
      ?auto_6398 - LOCATION
    )
    :vars
    (
      ?auto_6404 - LOCATION
      ?auto_6402 - CITY
      ?auto_6403 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6400 ?auto_6399 ) ) ( not ( = ?auto_6401 ?auto_6399 ) ) ( not ( = ?auto_6401 ?auto_6400 ) ) ( IN-CITY ?auto_6404 ?auto_6402 ) ( IN-CITY ?auto_6398 ?auto_6402 ) ( not ( = ?auto_6398 ?auto_6404 ) ) ( OBJ-AT ?auto_6399 ?auto_6398 ) ( OBJ-AT ?auto_6401 ?auto_6404 ) ( TRUCK-AT ?auto_6403 ?auto_6404 ) ( OBJ-AT ?auto_6400 ?auto_6404 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6399 ?auto_6401 ?auto_6398 )
      ( DELIVER-3PKG-VERIFY ?auto_6399 ?auto_6400 ?auto_6401 ?auto_6398 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6414 - OBJ
      ?auto_6415 - OBJ
      ?auto_6416 - OBJ
      ?auto_6413 - LOCATION
    )
    :vars
    (
      ?auto_6419 - LOCATION
      ?auto_6417 - CITY
      ?auto_6418 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6415 ?auto_6414 ) ) ( not ( = ?auto_6416 ?auto_6414 ) ) ( not ( = ?auto_6416 ?auto_6415 ) ) ( IN-CITY ?auto_6419 ?auto_6417 ) ( IN-CITY ?auto_6413 ?auto_6417 ) ( not ( = ?auto_6413 ?auto_6419 ) ) ( OBJ-AT ?auto_6414 ?auto_6413 ) ( OBJ-AT ?auto_6415 ?auto_6419 ) ( TRUCK-AT ?auto_6418 ?auto_6419 ) ( OBJ-AT ?auto_6416 ?auto_6419 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6414 ?auto_6415 ?auto_6413 )
      ( DELIVER-3PKG-VERIFY ?auto_6414 ?auto_6415 ?auto_6416 ?auto_6413 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6429 - OBJ
      ?auto_6430 - OBJ
      ?auto_6431 - OBJ
      ?auto_6428 - LOCATION
    )
    :vars
    (
      ?auto_6434 - LOCATION
      ?auto_6432 - CITY
      ?auto_6433 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6430 ?auto_6429 ) ) ( not ( = ?auto_6431 ?auto_6429 ) ) ( not ( = ?auto_6431 ?auto_6430 ) ) ( IN-CITY ?auto_6434 ?auto_6432 ) ( IN-CITY ?auto_6428 ?auto_6432 ) ( not ( = ?auto_6428 ?auto_6434 ) ) ( OBJ-AT ?auto_6430 ?auto_6428 ) ( OBJ-AT ?auto_6431 ?auto_6434 ) ( TRUCK-AT ?auto_6433 ?auto_6434 ) ( OBJ-AT ?auto_6429 ?auto_6434 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6430 ?auto_6431 ?auto_6428 )
      ( DELIVER-3PKG-VERIFY ?auto_6429 ?auto_6430 ?auto_6431 ?auto_6428 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6444 - OBJ
      ?auto_6445 - OBJ
      ?auto_6446 - OBJ
      ?auto_6443 - LOCATION
    )
    :vars
    (
      ?auto_6449 - LOCATION
      ?auto_6447 - CITY
      ?auto_6448 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6445 ?auto_6444 ) ) ( not ( = ?auto_6446 ?auto_6444 ) ) ( not ( = ?auto_6446 ?auto_6445 ) ) ( IN-CITY ?auto_6449 ?auto_6447 ) ( IN-CITY ?auto_6443 ?auto_6447 ) ( not ( = ?auto_6443 ?auto_6449 ) ) ( OBJ-AT ?auto_6446 ?auto_6443 ) ( OBJ-AT ?auto_6445 ?auto_6449 ) ( TRUCK-AT ?auto_6448 ?auto_6449 ) ( OBJ-AT ?auto_6444 ?auto_6449 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6446 ?auto_6445 ?auto_6443 )
      ( DELIVER-3PKG-VERIFY ?auto_6444 ?auto_6445 ?auto_6446 ?auto_6443 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6475 - OBJ
      ?auto_6476 - OBJ
      ?auto_6477 - OBJ
      ?auto_6474 - LOCATION
    )
    :vars
    (
      ?auto_6480 - LOCATION
      ?auto_6478 - CITY
      ?auto_6479 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6476 ?auto_6475 ) ) ( not ( = ?auto_6477 ?auto_6475 ) ) ( not ( = ?auto_6477 ?auto_6476 ) ) ( IN-CITY ?auto_6480 ?auto_6478 ) ( IN-CITY ?auto_6474 ?auto_6478 ) ( not ( = ?auto_6474 ?auto_6480 ) ) ( OBJ-AT ?auto_6476 ?auto_6474 ) ( OBJ-AT ?auto_6475 ?auto_6480 ) ( TRUCK-AT ?auto_6479 ?auto_6480 ) ( OBJ-AT ?auto_6477 ?auto_6480 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6476 ?auto_6475 ?auto_6474 )
      ( DELIVER-3PKG-VERIFY ?auto_6475 ?auto_6476 ?auto_6477 ?auto_6474 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6490 - OBJ
      ?auto_6491 - OBJ
      ?auto_6492 - OBJ
      ?auto_6489 - LOCATION
    )
    :vars
    (
      ?auto_6495 - LOCATION
      ?auto_6493 - CITY
      ?auto_6494 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6491 ?auto_6490 ) ) ( not ( = ?auto_6492 ?auto_6490 ) ) ( not ( = ?auto_6492 ?auto_6491 ) ) ( IN-CITY ?auto_6495 ?auto_6493 ) ( IN-CITY ?auto_6489 ?auto_6493 ) ( not ( = ?auto_6489 ?auto_6495 ) ) ( OBJ-AT ?auto_6492 ?auto_6489 ) ( OBJ-AT ?auto_6490 ?auto_6495 ) ( TRUCK-AT ?auto_6494 ?auto_6495 ) ( OBJ-AT ?auto_6491 ?auto_6495 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6492 ?auto_6490 ?auto_6489 )
      ( DELIVER-3PKG-VERIFY ?auto_6490 ?auto_6491 ?auto_6492 ?auto_6489 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6538 - OBJ
      ?auto_6537 - LOCATION
    )
    :vars
    (
      ?auto_6540 - OBJ
      ?auto_6542 - LOCATION
      ?auto_6539 - CITY
      ?auto_6543 - OBJ
      ?auto_6541 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6538 ?auto_6540 ) ) ( IN-CITY ?auto_6542 ?auto_6539 ) ( IN-CITY ?auto_6537 ?auto_6539 ) ( not ( = ?auto_6537 ?auto_6542 ) ) ( OBJ-AT ?auto_6540 ?auto_6537 ) ( OBJ-AT ?auto_6538 ?auto_6542 ) ( not ( = ?auto_6543 ?auto_6540 ) ) ( not ( = ?auto_6538 ?auto_6543 ) ) ( OBJ-AT ?auto_6543 ?auto_6542 ) ( TRUCK-AT ?auto_6541 ?auto_6537 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6541 ?auto_6537 ?auto_6542 ?auto_6539 )
      ( DELIVER-2PKG ?auto_6540 ?auto_6538 ?auto_6537 )
      ( DELIVER-1PKG-VERIFY ?auto_6538 ?auto_6537 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6545 - OBJ
      ?auto_6546 - OBJ
      ?auto_6544 - LOCATION
    )
    :vars
    (
      ?auto_6550 - LOCATION
      ?auto_6548 - CITY
      ?auto_6549 - OBJ
      ?auto_6547 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6546 ?auto_6545 ) ) ( IN-CITY ?auto_6550 ?auto_6548 ) ( IN-CITY ?auto_6544 ?auto_6548 ) ( not ( = ?auto_6544 ?auto_6550 ) ) ( OBJ-AT ?auto_6545 ?auto_6544 ) ( OBJ-AT ?auto_6546 ?auto_6550 ) ( not ( = ?auto_6549 ?auto_6545 ) ) ( not ( = ?auto_6546 ?auto_6549 ) ) ( OBJ-AT ?auto_6549 ?auto_6550 ) ( TRUCK-AT ?auto_6547 ?auto_6544 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6546 ?auto_6544 )
      ( DELIVER-2PKG-VERIFY ?auto_6545 ?auto_6546 ?auto_6544 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6552 - OBJ
      ?auto_6553 - OBJ
      ?auto_6551 - LOCATION
    )
    :vars
    (
      ?auto_6555 - OBJ
      ?auto_6554 - LOCATION
      ?auto_6556 - CITY
      ?auto_6557 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6553 ?auto_6552 ) ) ( not ( = ?auto_6553 ?auto_6555 ) ) ( IN-CITY ?auto_6554 ?auto_6556 ) ( IN-CITY ?auto_6551 ?auto_6556 ) ( not ( = ?auto_6551 ?auto_6554 ) ) ( OBJ-AT ?auto_6555 ?auto_6551 ) ( OBJ-AT ?auto_6553 ?auto_6554 ) ( not ( = ?auto_6552 ?auto_6555 ) ) ( OBJ-AT ?auto_6552 ?auto_6554 ) ( TRUCK-AT ?auto_6557 ?auto_6551 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6555 ?auto_6553 ?auto_6551 )
      ( DELIVER-2PKG-VERIFY ?auto_6552 ?auto_6553 ?auto_6551 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6559 - OBJ
      ?auto_6560 - OBJ
      ?auto_6558 - LOCATION
    )
    :vars
    (
      ?auto_6561 - LOCATION
      ?auto_6562 - CITY
      ?auto_6564 - OBJ
      ?auto_6563 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6560 ?auto_6559 ) ) ( IN-CITY ?auto_6561 ?auto_6562 ) ( IN-CITY ?auto_6558 ?auto_6562 ) ( not ( = ?auto_6558 ?auto_6561 ) ) ( OBJ-AT ?auto_6560 ?auto_6558 ) ( OBJ-AT ?auto_6559 ?auto_6561 ) ( not ( = ?auto_6564 ?auto_6560 ) ) ( not ( = ?auto_6559 ?auto_6564 ) ) ( OBJ-AT ?auto_6564 ?auto_6561 ) ( TRUCK-AT ?auto_6563 ?auto_6558 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6560 ?auto_6559 ?auto_6558 )
      ( DELIVER-2PKG-VERIFY ?auto_6559 ?auto_6560 ?auto_6558 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6566 - OBJ
      ?auto_6567 - OBJ
      ?auto_6565 - LOCATION
    )
    :vars
    (
      ?auto_6569 - OBJ
      ?auto_6568 - LOCATION
      ?auto_6570 - CITY
      ?auto_6571 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6567 ?auto_6566 ) ) ( not ( = ?auto_6566 ?auto_6569 ) ) ( IN-CITY ?auto_6568 ?auto_6570 ) ( IN-CITY ?auto_6565 ?auto_6570 ) ( not ( = ?auto_6565 ?auto_6568 ) ) ( OBJ-AT ?auto_6569 ?auto_6565 ) ( OBJ-AT ?auto_6566 ?auto_6568 ) ( not ( = ?auto_6567 ?auto_6569 ) ) ( OBJ-AT ?auto_6567 ?auto_6568 ) ( TRUCK-AT ?auto_6571 ?auto_6565 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6569 ?auto_6566 ?auto_6565 )
      ( DELIVER-2PKG-VERIFY ?auto_6566 ?auto_6567 ?auto_6565 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6589 - OBJ
      ?auto_6590 - OBJ
      ?auto_6591 - OBJ
      ?auto_6588 - LOCATION
    )
    :vars
    (
      ?auto_6592 - LOCATION
      ?auto_6593 - CITY
      ?auto_6594 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6590 ?auto_6589 ) ) ( not ( = ?auto_6591 ?auto_6589 ) ) ( not ( = ?auto_6591 ?auto_6590 ) ) ( IN-CITY ?auto_6592 ?auto_6593 ) ( IN-CITY ?auto_6588 ?auto_6593 ) ( not ( = ?auto_6588 ?auto_6592 ) ) ( OBJ-AT ?auto_6589 ?auto_6588 ) ( OBJ-AT ?auto_6591 ?auto_6592 ) ( OBJ-AT ?auto_6590 ?auto_6592 ) ( TRUCK-AT ?auto_6594 ?auto_6588 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6589 ?auto_6591 ?auto_6588 )
      ( DELIVER-3PKG-VERIFY ?auto_6589 ?auto_6590 ?auto_6591 ?auto_6588 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6604 - OBJ
      ?auto_6605 - OBJ
      ?auto_6606 - OBJ
      ?auto_6603 - LOCATION
    )
    :vars
    (
      ?auto_6607 - LOCATION
      ?auto_6608 - CITY
      ?auto_6609 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6605 ?auto_6604 ) ) ( not ( = ?auto_6606 ?auto_6604 ) ) ( not ( = ?auto_6606 ?auto_6605 ) ) ( IN-CITY ?auto_6607 ?auto_6608 ) ( IN-CITY ?auto_6603 ?auto_6608 ) ( not ( = ?auto_6603 ?auto_6607 ) ) ( OBJ-AT ?auto_6604 ?auto_6603 ) ( OBJ-AT ?auto_6605 ?auto_6607 ) ( OBJ-AT ?auto_6606 ?auto_6607 ) ( TRUCK-AT ?auto_6609 ?auto_6603 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6604 ?auto_6605 ?auto_6603 )
      ( DELIVER-3PKG-VERIFY ?auto_6604 ?auto_6605 ?auto_6606 ?auto_6603 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6619 - OBJ
      ?auto_6620 - OBJ
      ?auto_6621 - OBJ
      ?auto_6618 - LOCATION
    )
    :vars
    (
      ?auto_6622 - LOCATION
      ?auto_6623 - CITY
      ?auto_6624 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6620 ?auto_6619 ) ) ( not ( = ?auto_6621 ?auto_6619 ) ) ( not ( = ?auto_6621 ?auto_6620 ) ) ( IN-CITY ?auto_6622 ?auto_6623 ) ( IN-CITY ?auto_6618 ?auto_6623 ) ( not ( = ?auto_6618 ?auto_6622 ) ) ( OBJ-AT ?auto_6620 ?auto_6618 ) ( OBJ-AT ?auto_6621 ?auto_6622 ) ( OBJ-AT ?auto_6619 ?auto_6622 ) ( TRUCK-AT ?auto_6624 ?auto_6618 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6620 ?auto_6621 ?auto_6618 )
      ( DELIVER-3PKG-VERIFY ?auto_6619 ?auto_6620 ?auto_6621 ?auto_6618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6634 - OBJ
      ?auto_6635 - OBJ
      ?auto_6636 - OBJ
      ?auto_6633 - LOCATION
    )
    :vars
    (
      ?auto_6637 - LOCATION
      ?auto_6638 - CITY
      ?auto_6639 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6635 ?auto_6634 ) ) ( not ( = ?auto_6636 ?auto_6634 ) ) ( not ( = ?auto_6636 ?auto_6635 ) ) ( IN-CITY ?auto_6637 ?auto_6638 ) ( IN-CITY ?auto_6633 ?auto_6638 ) ( not ( = ?auto_6633 ?auto_6637 ) ) ( OBJ-AT ?auto_6636 ?auto_6633 ) ( OBJ-AT ?auto_6635 ?auto_6637 ) ( OBJ-AT ?auto_6634 ?auto_6637 ) ( TRUCK-AT ?auto_6639 ?auto_6633 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6636 ?auto_6635 ?auto_6633 )
      ( DELIVER-3PKG-VERIFY ?auto_6634 ?auto_6635 ?auto_6636 ?auto_6633 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6665 - OBJ
      ?auto_6666 - OBJ
      ?auto_6667 - OBJ
      ?auto_6664 - LOCATION
    )
    :vars
    (
      ?auto_6668 - LOCATION
      ?auto_6669 - CITY
      ?auto_6670 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6666 ?auto_6665 ) ) ( not ( = ?auto_6667 ?auto_6665 ) ) ( not ( = ?auto_6667 ?auto_6666 ) ) ( IN-CITY ?auto_6668 ?auto_6669 ) ( IN-CITY ?auto_6664 ?auto_6669 ) ( not ( = ?auto_6664 ?auto_6668 ) ) ( OBJ-AT ?auto_6666 ?auto_6664 ) ( OBJ-AT ?auto_6665 ?auto_6668 ) ( OBJ-AT ?auto_6667 ?auto_6668 ) ( TRUCK-AT ?auto_6670 ?auto_6664 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6666 ?auto_6665 ?auto_6664 )
      ( DELIVER-3PKG-VERIFY ?auto_6665 ?auto_6666 ?auto_6667 ?auto_6664 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6680 - OBJ
      ?auto_6681 - OBJ
      ?auto_6682 - OBJ
      ?auto_6679 - LOCATION
    )
    :vars
    (
      ?auto_6683 - LOCATION
      ?auto_6684 - CITY
      ?auto_6685 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6681 ?auto_6680 ) ) ( not ( = ?auto_6682 ?auto_6680 ) ) ( not ( = ?auto_6682 ?auto_6681 ) ) ( IN-CITY ?auto_6683 ?auto_6684 ) ( IN-CITY ?auto_6679 ?auto_6684 ) ( not ( = ?auto_6679 ?auto_6683 ) ) ( OBJ-AT ?auto_6682 ?auto_6679 ) ( OBJ-AT ?auto_6680 ?auto_6683 ) ( OBJ-AT ?auto_6681 ?auto_6683 ) ( TRUCK-AT ?auto_6685 ?auto_6679 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6682 ?auto_6680 ?auto_6679 )
      ( DELIVER-3PKG-VERIFY ?auto_6680 ?auto_6681 ?auto_6682 ?auto_6679 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6728 - OBJ
      ?auto_6727 - LOCATION
    )
    :vars
    (
      ?auto_6730 - OBJ
      ?auto_6729 - LOCATION
      ?auto_6731 - CITY
      ?auto_6733 - OBJ
      ?auto_6732 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6728 ?auto_6730 ) ) ( IN-CITY ?auto_6729 ?auto_6731 ) ( IN-CITY ?auto_6727 ?auto_6731 ) ( not ( = ?auto_6727 ?auto_6729 ) ) ( OBJ-AT ?auto_6728 ?auto_6729 ) ( not ( = ?auto_6733 ?auto_6730 ) ) ( not ( = ?auto_6728 ?auto_6733 ) ) ( OBJ-AT ?auto_6733 ?auto_6729 ) ( TRUCK-AT ?auto_6732 ?auto_6727 ) ( IN-TRUCK ?auto_6730 ?auto_6732 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6730 ?auto_6727 )
      ( DELIVER-2PKG ?auto_6730 ?auto_6728 ?auto_6727 )
      ( DELIVER-1PKG-VERIFY ?auto_6728 ?auto_6727 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6735 - OBJ
      ?auto_6736 - OBJ
      ?auto_6734 - LOCATION
    )
    :vars
    (
      ?auto_6737 - LOCATION
      ?auto_6738 - CITY
      ?auto_6740 - OBJ
      ?auto_6739 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6736 ?auto_6735 ) ) ( IN-CITY ?auto_6737 ?auto_6738 ) ( IN-CITY ?auto_6734 ?auto_6738 ) ( not ( = ?auto_6734 ?auto_6737 ) ) ( OBJ-AT ?auto_6736 ?auto_6737 ) ( not ( = ?auto_6740 ?auto_6735 ) ) ( not ( = ?auto_6736 ?auto_6740 ) ) ( OBJ-AT ?auto_6740 ?auto_6737 ) ( TRUCK-AT ?auto_6739 ?auto_6734 ) ( IN-TRUCK ?auto_6735 ?auto_6739 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6736 ?auto_6734 )
      ( DELIVER-2PKG-VERIFY ?auto_6735 ?auto_6736 ?auto_6734 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6742 - OBJ
      ?auto_6743 - OBJ
      ?auto_6741 - LOCATION
    )
    :vars
    (
      ?auto_6744 - OBJ
      ?auto_6747 - LOCATION
      ?auto_6745 - CITY
      ?auto_6746 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6743 ?auto_6742 ) ) ( not ( = ?auto_6743 ?auto_6744 ) ) ( IN-CITY ?auto_6747 ?auto_6745 ) ( IN-CITY ?auto_6741 ?auto_6745 ) ( not ( = ?auto_6741 ?auto_6747 ) ) ( OBJ-AT ?auto_6743 ?auto_6747 ) ( not ( = ?auto_6742 ?auto_6744 ) ) ( OBJ-AT ?auto_6742 ?auto_6747 ) ( TRUCK-AT ?auto_6746 ?auto_6741 ) ( IN-TRUCK ?auto_6744 ?auto_6746 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6744 ?auto_6743 ?auto_6741 )
      ( DELIVER-2PKG-VERIFY ?auto_6742 ?auto_6743 ?auto_6741 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6749 - OBJ
      ?auto_6750 - OBJ
      ?auto_6748 - LOCATION
    )
    :vars
    (
      ?auto_6754 - LOCATION
      ?auto_6752 - CITY
      ?auto_6751 - OBJ
      ?auto_6753 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6750 ?auto_6749 ) ) ( IN-CITY ?auto_6754 ?auto_6752 ) ( IN-CITY ?auto_6748 ?auto_6752 ) ( not ( = ?auto_6748 ?auto_6754 ) ) ( OBJ-AT ?auto_6749 ?auto_6754 ) ( not ( = ?auto_6751 ?auto_6750 ) ) ( not ( = ?auto_6749 ?auto_6751 ) ) ( OBJ-AT ?auto_6751 ?auto_6754 ) ( TRUCK-AT ?auto_6753 ?auto_6748 ) ( IN-TRUCK ?auto_6750 ?auto_6753 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6750 ?auto_6749 ?auto_6748 )
      ( DELIVER-2PKG-VERIFY ?auto_6749 ?auto_6750 ?auto_6748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6756 - OBJ
      ?auto_6757 - OBJ
      ?auto_6755 - LOCATION
    )
    :vars
    (
      ?auto_6758 - OBJ
      ?auto_6761 - LOCATION
      ?auto_6759 - CITY
      ?auto_6760 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6757 ?auto_6756 ) ) ( not ( = ?auto_6756 ?auto_6758 ) ) ( IN-CITY ?auto_6761 ?auto_6759 ) ( IN-CITY ?auto_6755 ?auto_6759 ) ( not ( = ?auto_6755 ?auto_6761 ) ) ( OBJ-AT ?auto_6756 ?auto_6761 ) ( not ( = ?auto_6757 ?auto_6758 ) ) ( OBJ-AT ?auto_6757 ?auto_6761 ) ( TRUCK-AT ?auto_6760 ?auto_6755 ) ( IN-TRUCK ?auto_6758 ?auto_6760 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6758 ?auto_6756 ?auto_6755 )
      ( DELIVER-2PKG-VERIFY ?auto_6756 ?auto_6757 ?auto_6755 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6779 - OBJ
      ?auto_6780 - OBJ
      ?auto_6781 - OBJ
      ?auto_6778 - LOCATION
    )
    :vars
    (
      ?auto_6784 - LOCATION
      ?auto_6782 - CITY
      ?auto_6783 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6780 ?auto_6779 ) ) ( not ( = ?auto_6781 ?auto_6779 ) ) ( not ( = ?auto_6781 ?auto_6780 ) ) ( IN-CITY ?auto_6784 ?auto_6782 ) ( IN-CITY ?auto_6778 ?auto_6782 ) ( not ( = ?auto_6778 ?auto_6784 ) ) ( OBJ-AT ?auto_6781 ?auto_6784 ) ( OBJ-AT ?auto_6780 ?auto_6784 ) ( TRUCK-AT ?auto_6783 ?auto_6778 ) ( IN-TRUCK ?auto_6779 ?auto_6783 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6779 ?auto_6781 ?auto_6778 )
      ( DELIVER-3PKG-VERIFY ?auto_6779 ?auto_6780 ?auto_6781 ?auto_6778 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6794 - OBJ
      ?auto_6795 - OBJ
      ?auto_6796 - OBJ
      ?auto_6793 - LOCATION
    )
    :vars
    (
      ?auto_6799 - LOCATION
      ?auto_6797 - CITY
      ?auto_6798 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6795 ?auto_6794 ) ) ( not ( = ?auto_6796 ?auto_6794 ) ) ( not ( = ?auto_6796 ?auto_6795 ) ) ( IN-CITY ?auto_6799 ?auto_6797 ) ( IN-CITY ?auto_6793 ?auto_6797 ) ( not ( = ?auto_6793 ?auto_6799 ) ) ( OBJ-AT ?auto_6795 ?auto_6799 ) ( OBJ-AT ?auto_6796 ?auto_6799 ) ( TRUCK-AT ?auto_6798 ?auto_6793 ) ( IN-TRUCK ?auto_6794 ?auto_6798 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6794 ?auto_6795 ?auto_6793 )
      ( DELIVER-3PKG-VERIFY ?auto_6794 ?auto_6795 ?auto_6796 ?auto_6793 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6809 - OBJ
      ?auto_6810 - OBJ
      ?auto_6811 - OBJ
      ?auto_6808 - LOCATION
    )
    :vars
    (
      ?auto_6814 - LOCATION
      ?auto_6812 - CITY
      ?auto_6813 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6810 ?auto_6809 ) ) ( not ( = ?auto_6811 ?auto_6809 ) ) ( not ( = ?auto_6811 ?auto_6810 ) ) ( IN-CITY ?auto_6814 ?auto_6812 ) ( IN-CITY ?auto_6808 ?auto_6812 ) ( not ( = ?auto_6808 ?auto_6814 ) ) ( OBJ-AT ?auto_6811 ?auto_6814 ) ( OBJ-AT ?auto_6809 ?auto_6814 ) ( TRUCK-AT ?auto_6813 ?auto_6808 ) ( IN-TRUCK ?auto_6810 ?auto_6813 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6810 ?auto_6811 ?auto_6808 )
      ( DELIVER-3PKG-VERIFY ?auto_6809 ?auto_6810 ?auto_6811 ?auto_6808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6824 - OBJ
      ?auto_6825 - OBJ
      ?auto_6826 - OBJ
      ?auto_6823 - LOCATION
    )
    :vars
    (
      ?auto_6829 - LOCATION
      ?auto_6827 - CITY
      ?auto_6828 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6825 ?auto_6824 ) ) ( not ( = ?auto_6826 ?auto_6824 ) ) ( not ( = ?auto_6826 ?auto_6825 ) ) ( IN-CITY ?auto_6829 ?auto_6827 ) ( IN-CITY ?auto_6823 ?auto_6827 ) ( not ( = ?auto_6823 ?auto_6829 ) ) ( OBJ-AT ?auto_6825 ?auto_6829 ) ( OBJ-AT ?auto_6824 ?auto_6829 ) ( TRUCK-AT ?auto_6828 ?auto_6823 ) ( IN-TRUCK ?auto_6826 ?auto_6828 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6826 ?auto_6825 ?auto_6823 )
      ( DELIVER-3PKG-VERIFY ?auto_6824 ?auto_6825 ?auto_6826 ?auto_6823 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6855 - OBJ
      ?auto_6856 - OBJ
      ?auto_6857 - OBJ
      ?auto_6854 - LOCATION
    )
    :vars
    (
      ?auto_6860 - LOCATION
      ?auto_6858 - CITY
      ?auto_6859 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6856 ?auto_6855 ) ) ( not ( = ?auto_6857 ?auto_6855 ) ) ( not ( = ?auto_6857 ?auto_6856 ) ) ( IN-CITY ?auto_6860 ?auto_6858 ) ( IN-CITY ?auto_6854 ?auto_6858 ) ( not ( = ?auto_6854 ?auto_6860 ) ) ( OBJ-AT ?auto_6855 ?auto_6860 ) ( OBJ-AT ?auto_6857 ?auto_6860 ) ( TRUCK-AT ?auto_6859 ?auto_6854 ) ( IN-TRUCK ?auto_6856 ?auto_6859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6856 ?auto_6855 ?auto_6854 )
      ( DELIVER-3PKG-VERIFY ?auto_6855 ?auto_6856 ?auto_6857 ?auto_6854 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6870 - OBJ
      ?auto_6871 - OBJ
      ?auto_6872 - OBJ
      ?auto_6869 - LOCATION
    )
    :vars
    (
      ?auto_6875 - LOCATION
      ?auto_6873 - CITY
      ?auto_6874 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_6871 ?auto_6870 ) ) ( not ( = ?auto_6872 ?auto_6870 ) ) ( not ( = ?auto_6872 ?auto_6871 ) ) ( IN-CITY ?auto_6875 ?auto_6873 ) ( IN-CITY ?auto_6869 ?auto_6873 ) ( not ( = ?auto_6869 ?auto_6875 ) ) ( OBJ-AT ?auto_6870 ?auto_6875 ) ( OBJ-AT ?auto_6871 ?auto_6875 ) ( TRUCK-AT ?auto_6874 ?auto_6869 ) ( IN-TRUCK ?auto_6872 ?auto_6874 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6872 ?auto_6870 ?auto_6869 )
      ( DELIVER-3PKG-VERIFY ?auto_6870 ?auto_6871 ?auto_6872 ?auto_6869 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6918 - OBJ
      ?auto_6917 - LOCATION
    )
    :vars
    (
      ?auto_6919 - OBJ
      ?auto_6923 - LOCATION
      ?auto_6921 - CITY
      ?auto_6920 - OBJ
      ?auto_6922 - TRUCK
      ?auto_6924 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_6918 ?auto_6919 ) ) ( IN-CITY ?auto_6923 ?auto_6921 ) ( IN-CITY ?auto_6917 ?auto_6921 ) ( not ( = ?auto_6917 ?auto_6923 ) ) ( OBJ-AT ?auto_6918 ?auto_6923 ) ( not ( = ?auto_6920 ?auto_6919 ) ) ( not ( = ?auto_6918 ?auto_6920 ) ) ( OBJ-AT ?auto_6920 ?auto_6923 ) ( IN-TRUCK ?auto_6919 ?auto_6922 ) ( TRUCK-AT ?auto_6922 ?auto_6924 ) ( IN-CITY ?auto_6924 ?auto_6921 ) ( not ( = ?auto_6917 ?auto_6924 ) ) ( not ( = ?auto_6923 ?auto_6924 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6922 ?auto_6924 ?auto_6917 ?auto_6921 )
      ( DELIVER-2PKG ?auto_6919 ?auto_6918 ?auto_6917 )
      ( DELIVER-1PKG-VERIFY ?auto_6918 ?auto_6917 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6926 - OBJ
      ?auto_6927 - OBJ
      ?auto_6925 - LOCATION
    )
    :vars
    (
      ?auto_6929 - LOCATION
      ?auto_6932 - CITY
      ?auto_6931 - OBJ
      ?auto_6928 - TRUCK
      ?auto_6930 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_6927 ?auto_6926 ) ) ( IN-CITY ?auto_6929 ?auto_6932 ) ( IN-CITY ?auto_6925 ?auto_6932 ) ( not ( = ?auto_6925 ?auto_6929 ) ) ( OBJ-AT ?auto_6927 ?auto_6929 ) ( not ( = ?auto_6931 ?auto_6926 ) ) ( not ( = ?auto_6927 ?auto_6931 ) ) ( OBJ-AT ?auto_6931 ?auto_6929 ) ( IN-TRUCK ?auto_6926 ?auto_6928 ) ( TRUCK-AT ?auto_6928 ?auto_6930 ) ( IN-CITY ?auto_6930 ?auto_6932 ) ( not ( = ?auto_6925 ?auto_6930 ) ) ( not ( = ?auto_6929 ?auto_6930 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6927 ?auto_6925 )
      ( DELIVER-2PKG-VERIFY ?auto_6926 ?auto_6927 ?auto_6925 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6934 - OBJ
      ?auto_6935 - OBJ
      ?auto_6933 - LOCATION
    )
    :vars
    (
      ?auto_6940 - OBJ
      ?auto_6936 - LOCATION
      ?auto_6937 - CITY
      ?auto_6939 - TRUCK
      ?auto_6938 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_6935 ?auto_6934 ) ) ( not ( = ?auto_6935 ?auto_6940 ) ) ( IN-CITY ?auto_6936 ?auto_6937 ) ( IN-CITY ?auto_6933 ?auto_6937 ) ( not ( = ?auto_6933 ?auto_6936 ) ) ( OBJ-AT ?auto_6935 ?auto_6936 ) ( not ( = ?auto_6934 ?auto_6940 ) ) ( OBJ-AT ?auto_6934 ?auto_6936 ) ( IN-TRUCK ?auto_6940 ?auto_6939 ) ( TRUCK-AT ?auto_6939 ?auto_6938 ) ( IN-CITY ?auto_6938 ?auto_6937 ) ( not ( = ?auto_6933 ?auto_6938 ) ) ( not ( = ?auto_6936 ?auto_6938 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6940 ?auto_6935 ?auto_6933 )
      ( DELIVER-2PKG-VERIFY ?auto_6934 ?auto_6935 ?auto_6933 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6942 - OBJ
      ?auto_6943 - OBJ
      ?auto_6941 - LOCATION
    )
    :vars
    (
      ?auto_6944 - LOCATION
      ?auto_6946 - CITY
      ?auto_6945 - OBJ
      ?auto_6948 - TRUCK
      ?auto_6947 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_6943 ?auto_6942 ) ) ( IN-CITY ?auto_6944 ?auto_6946 ) ( IN-CITY ?auto_6941 ?auto_6946 ) ( not ( = ?auto_6941 ?auto_6944 ) ) ( OBJ-AT ?auto_6942 ?auto_6944 ) ( not ( = ?auto_6945 ?auto_6943 ) ) ( not ( = ?auto_6942 ?auto_6945 ) ) ( OBJ-AT ?auto_6945 ?auto_6944 ) ( IN-TRUCK ?auto_6943 ?auto_6948 ) ( TRUCK-AT ?auto_6948 ?auto_6947 ) ( IN-CITY ?auto_6947 ?auto_6946 ) ( not ( = ?auto_6941 ?auto_6947 ) ) ( not ( = ?auto_6944 ?auto_6947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6943 ?auto_6942 ?auto_6941 )
      ( DELIVER-2PKG-VERIFY ?auto_6942 ?auto_6943 ?auto_6941 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6950 - OBJ
      ?auto_6951 - OBJ
      ?auto_6949 - LOCATION
    )
    :vars
    (
      ?auto_6956 - OBJ
      ?auto_6952 - LOCATION
      ?auto_6953 - CITY
      ?auto_6955 - TRUCK
      ?auto_6954 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_6951 ?auto_6950 ) ) ( not ( = ?auto_6950 ?auto_6956 ) ) ( IN-CITY ?auto_6952 ?auto_6953 ) ( IN-CITY ?auto_6949 ?auto_6953 ) ( not ( = ?auto_6949 ?auto_6952 ) ) ( OBJ-AT ?auto_6950 ?auto_6952 ) ( not ( = ?auto_6951 ?auto_6956 ) ) ( OBJ-AT ?auto_6951 ?auto_6952 ) ( IN-TRUCK ?auto_6956 ?auto_6955 ) ( TRUCK-AT ?auto_6955 ?auto_6954 ) ( IN-CITY ?auto_6954 ?auto_6953 ) ( not ( = ?auto_6949 ?auto_6954 ) ) ( not ( = ?auto_6952 ?auto_6954 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6956 ?auto_6950 ?auto_6949 )
      ( DELIVER-2PKG-VERIFY ?auto_6950 ?auto_6951 ?auto_6949 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6976 - OBJ
      ?auto_6977 - OBJ
      ?auto_6978 - OBJ
      ?auto_6975 - LOCATION
    )
    :vars
    (
      ?auto_6979 - LOCATION
      ?auto_6980 - CITY
      ?auto_6982 - TRUCK
      ?auto_6981 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_6977 ?auto_6976 ) ) ( not ( = ?auto_6978 ?auto_6976 ) ) ( not ( = ?auto_6978 ?auto_6977 ) ) ( IN-CITY ?auto_6979 ?auto_6980 ) ( IN-CITY ?auto_6975 ?auto_6980 ) ( not ( = ?auto_6975 ?auto_6979 ) ) ( OBJ-AT ?auto_6978 ?auto_6979 ) ( OBJ-AT ?auto_6977 ?auto_6979 ) ( IN-TRUCK ?auto_6976 ?auto_6982 ) ( TRUCK-AT ?auto_6982 ?auto_6981 ) ( IN-CITY ?auto_6981 ?auto_6980 ) ( not ( = ?auto_6975 ?auto_6981 ) ) ( not ( = ?auto_6979 ?auto_6981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6976 ?auto_6978 ?auto_6975 )
      ( DELIVER-3PKG-VERIFY ?auto_6976 ?auto_6977 ?auto_6978 ?auto_6975 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6993 - OBJ
      ?auto_6994 - OBJ
      ?auto_6995 - OBJ
      ?auto_6992 - LOCATION
    )
    :vars
    (
      ?auto_6996 - LOCATION
      ?auto_6997 - CITY
      ?auto_6999 - TRUCK
      ?auto_6998 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_6994 ?auto_6993 ) ) ( not ( = ?auto_6995 ?auto_6993 ) ) ( not ( = ?auto_6995 ?auto_6994 ) ) ( IN-CITY ?auto_6996 ?auto_6997 ) ( IN-CITY ?auto_6992 ?auto_6997 ) ( not ( = ?auto_6992 ?auto_6996 ) ) ( OBJ-AT ?auto_6994 ?auto_6996 ) ( OBJ-AT ?auto_6995 ?auto_6996 ) ( IN-TRUCK ?auto_6993 ?auto_6999 ) ( TRUCK-AT ?auto_6999 ?auto_6998 ) ( IN-CITY ?auto_6998 ?auto_6997 ) ( not ( = ?auto_6992 ?auto_6998 ) ) ( not ( = ?auto_6996 ?auto_6998 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6993 ?auto_6994 ?auto_6992 )
      ( DELIVER-3PKG-VERIFY ?auto_6993 ?auto_6994 ?auto_6995 ?auto_6992 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7010 - OBJ
      ?auto_7011 - OBJ
      ?auto_7012 - OBJ
      ?auto_7009 - LOCATION
    )
    :vars
    (
      ?auto_7013 - LOCATION
      ?auto_7014 - CITY
      ?auto_7016 - TRUCK
      ?auto_7015 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7011 ?auto_7010 ) ) ( not ( = ?auto_7012 ?auto_7010 ) ) ( not ( = ?auto_7012 ?auto_7011 ) ) ( IN-CITY ?auto_7013 ?auto_7014 ) ( IN-CITY ?auto_7009 ?auto_7014 ) ( not ( = ?auto_7009 ?auto_7013 ) ) ( OBJ-AT ?auto_7012 ?auto_7013 ) ( OBJ-AT ?auto_7010 ?auto_7013 ) ( IN-TRUCK ?auto_7011 ?auto_7016 ) ( TRUCK-AT ?auto_7016 ?auto_7015 ) ( IN-CITY ?auto_7015 ?auto_7014 ) ( not ( = ?auto_7009 ?auto_7015 ) ) ( not ( = ?auto_7013 ?auto_7015 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7011 ?auto_7012 ?auto_7009 )
      ( DELIVER-3PKG-VERIFY ?auto_7010 ?auto_7011 ?auto_7012 ?auto_7009 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7027 - OBJ
      ?auto_7028 - OBJ
      ?auto_7029 - OBJ
      ?auto_7026 - LOCATION
    )
    :vars
    (
      ?auto_7030 - LOCATION
      ?auto_7031 - CITY
      ?auto_7033 - TRUCK
      ?auto_7032 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7028 ?auto_7027 ) ) ( not ( = ?auto_7029 ?auto_7027 ) ) ( not ( = ?auto_7029 ?auto_7028 ) ) ( IN-CITY ?auto_7030 ?auto_7031 ) ( IN-CITY ?auto_7026 ?auto_7031 ) ( not ( = ?auto_7026 ?auto_7030 ) ) ( OBJ-AT ?auto_7028 ?auto_7030 ) ( OBJ-AT ?auto_7027 ?auto_7030 ) ( IN-TRUCK ?auto_7029 ?auto_7033 ) ( TRUCK-AT ?auto_7033 ?auto_7032 ) ( IN-CITY ?auto_7032 ?auto_7031 ) ( not ( = ?auto_7026 ?auto_7032 ) ) ( not ( = ?auto_7030 ?auto_7032 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7029 ?auto_7028 ?auto_7026 )
      ( DELIVER-3PKG-VERIFY ?auto_7027 ?auto_7028 ?auto_7029 ?auto_7026 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7062 - OBJ
      ?auto_7063 - OBJ
      ?auto_7064 - OBJ
      ?auto_7061 - LOCATION
    )
    :vars
    (
      ?auto_7065 - LOCATION
      ?auto_7066 - CITY
      ?auto_7068 - TRUCK
      ?auto_7067 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7063 ?auto_7062 ) ) ( not ( = ?auto_7064 ?auto_7062 ) ) ( not ( = ?auto_7064 ?auto_7063 ) ) ( IN-CITY ?auto_7065 ?auto_7066 ) ( IN-CITY ?auto_7061 ?auto_7066 ) ( not ( = ?auto_7061 ?auto_7065 ) ) ( OBJ-AT ?auto_7062 ?auto_7065 ) ( OBJ-AT ?auto_7064 ?auto_7065 ) ( IN-TRUCK ?auto_7063 ?auto_7068 ) ( TRUCK-AT ?auto_7068 ?auto_7067 ) ( IN-CITY ?auto_7067 ?auto_7066 ) ( not ( = ?auto_7061 ?auto_7067 ) ) ( not ( = ?auto_7065 ?auto_7067 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7063 ?auto_7062 ?auto_7061 )
      ( DELIVER-3PKG-VERIFY ?auto_7062 ?auto_7063 ?auto_7064 ?auto_7061 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7079 - OBJ
      ?auto_7080 - OBJ
      ?auto_7081 - OBJ
      ?auto_7078 - LOCATION
    )
    :vars
    (
      ?auto_7082 - LOCATION
      ?auto_7083 - CITY
      ?auto_7085 - TRUCK
      ?auto_7084 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7080 ?auto_7079 ) ) ( not ( = ?auto_7081 ?auto_7079 ) ) ( not ( = ?auto_7081 ?auto_7080 ) ) ( IN-CITY ?auto_7082 ?auto_7083 ) ( IN-CITY ?auto_7078 ?auto_7083 ) ( not ( = ?auto_7078 ?auto_7082 ) ) ( OBJ-AT ?auto_7079 ?auto_7082 ) ( OBJ-AT ?auto_7080 ?auto_7082 ) ( IN-TRUCK ?auto_7081 ?auto_7085 ) ( TRUCK-AT ?auto_7085 ?auto_7084 ) ( IN-CITY ?auto_7084 ?auto_7083 ) ( not ( = ?auto_7078 ?auto_7084 ) ) ( not ( = ?auto_7082 ?auto_7084 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7081 ?auto_7079 ?auto_7078 )
      ( DELIVER-3PKG-VERIFY ?auto_7079 ?auto_7080 ?auto_7081 ?auto_7078 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7133 - OBJ
      ?auto_7132 - LOCATION
    )
    :vars
    (
      ?auto_7139 - OBJ
      ?auto_7134 - LOCATION
      ?auto_7136 - CITY
      ?auto_7135 - OBJ
      ?auto_7138 - TRUCK
      ?auto_7137 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7133 ?auto_7139 ) ) ( IN-CITY ?auto_7134 ?auto_7136 ) ( IN-CITY ?auto_7132 ?auto_7136 ) ( not ( = ?auto_7132 ?auto_7134 ) ) ( OBJ-AT ?auto_7133 ?auto_7134 ) ( not ( = ?auto_7135 ?auto_7139 ) ) ( not ( = ?auto_7133 ?auto_7135 ) ) ( OBJ-AT ?auto_7135 ?auto_7134 ) ( TRUCK-AT ?auto_7138 ?auto_7137 ) ( IN-CITY ?auto_7137 ?auto_7136 ) ( not ( = ?auto_7132 ?auto_7137 ) ) ( not ( = ?auto_7134 ?auto_7137 ) ) ( OBJ-AT ?auto_7139 ?auto_7137 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7139 ?auto_7138 ?auto_7137 )
      ( DELIVER-2PKG ?auto_7139 ?auto_7133 ?auto_7132 )
      ( DELIVER-1PKG-VERIFY ?auto_7133 ?auto_7132 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7141 - OBJ
      ?auto_7142 - OBJ
      ?auto_7140 - LOCATION
    )
    :vars
    (
      ?auto_7146 - LOCATION
      ?auto_7147 - CITY
      ?auto_7145 - OBJ
      ?auto_7144 - TRUCK
      ?auto_7143 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7142 ?auto_7141 ) ) ( IN-CITY ?auto_7146 ?auto_7147 ) ( IN-CITY ?auto_7140 ?auto_7147 ) ( not ( = ?auto_7140 ?auto_7146 ) ) ( OBJ-AT ?auto_7142 ?auto_7146 ) ( not ( = ?auto_7145 ?auto_7141 ) ) ( not ( = ?auto_7142 ?auto_7145 ) ) ( OBJ-AT ?auto_7145 ?auto_7146 ) ( TRUCK-AT ?auto_7144 ?auto_7143 ) ( IN-CITY ?auto_7143 ?auto_7147 ) ( not ( = ?auto_7140 ?auto_7143 ) ) ( not ( = ?auto_7146 ?auto_7143 ) ) ( OBJ-AT ?auto_7141 ?auto_7143 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7142 ?auto_7140 )
      ( DELIVER-2PKG-VERIFY ?auto_7141 ?auto_7142 ?auto_7140 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7149 - OBJ
      ?auto_7150 - OBJ
      ?auto_7148 - LOCATION
    )
    :vars
    (
      ?auto_7155 - OBJ
      ?auto_7154 - LOCATION
      ?auto_7151 - CITY
      ?auto_7153 - TRUCK
      ?auto_7152 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7150 ?auto_7149 ) ) ( not ( = ?auto_7150 ?auto_7155 ) ) ( IN-CITY ?auto_7154 ?auto_7151 ) ( IN-CITY ?auto_7148 ?auto_7151 ) ( not ( = ?auto_7148 ?auto_7154 ) ) ( OBJ-AT ?auto_7150 ?auto_7154 ) ( not ( = ?auto_7149 ?auto_7155 ) ) ( OBJ-AT ?auto_7149 ?auto_7154 ) ( TRUCK-AT ?auto_7153 ?auto_7152 ) ( IN-CITY ?auto_7152 ?auto_7151 ) ( not ( = ?auto_7148 ?auto_7152 ) ) ( not ( = ?auto_7154 ?auto_7152 ) ) ( OBJ-AT ?auto_7155 ?auto_7152 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7155 ?auto_7150 ?auto_7148 )
      ( DELIVER-2PKG-VERIFY ?auto_7149 ?auto_7150 ?auto_7148 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7157 - OBJ
      ?auto_7158 - OBJ
      ?auto_7156 - LOCATION
    )
    :vars
    (
      ?auto_7163 - LOCATION
      ?auto_7159 - CITY
      ?auto_7162 - OBJ
      ?auto_7161 - TRUCK
      ?auto_7160 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7158 ?auto_7157 ) ) ( IN-CITY ?auto_7163 ?auto_7159 ) ( IN-CITY ?auto_7156 ?auto_7159 ) ( not ( = ?auto_7156 ?auto_7163 ) ) ( OBJ-AT ?auto_7157 ?auto_7163 ) ( not ( = ?auto_7162 ?auto_7158 ) ) ( not ( = ?auto_7157 ?auto_7162 ) ) ( OBJ-AT ?auto_7162 ?auto_7163 ) ( TRUCK-AT ?auto_7161 ?auto_7160 ) ( IN-CITY ?auto_7160 ?auto_7159 ) ( not ( = ?auto_7156 ?auto_7160 ) ) ( not ( = ?auto_7163 ?auto_7160 ) ) ( OBJ-AT ?auto_7158 ?auto_7160 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7158 ?auto_7157 ?auto_7156 )
      ( DELIVER-2PKG-VERIFY ?auto_7157 ?auto_7158 ?auto_7156 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7165 - OBJ
      ?auto_7166 - OBJ
      ?auto_7164 - LOCATION
    )
    :vars
    (
      ?auto_7171 - OBJ
      ?auto_7170 - LOCATION
      ?auto_7167 - CITY
      ?auto_7169 - TRUCK
      ?auto_7168 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7166 ?auto_7165 ) ) ( not ( = ?auto_7165 ?auto_7171 ) ) ( IN-CITY ?auto_7170 ?auto_7167 ) ( IN-CITY ?auto_7164 ?auto_7167 ) ( not ( = ?auto_7164 ?auto_7170 ) ) ( OBJ-AT ?auto_7165 ?auto_7170 ) ( not ( = ?auto_7166 ?auto_7171 ) ) ( OBJ-AT ?auto_7166 ?auto_7170 ) ( TRUCK-AT ?auto_7169 ?auto_7168 ) ( IN-CITY ?auto_7168 ?auto_7167 ) ( not ( = ?auto_7164 ?auto_7168 ) ) ( not ( = ?auto_7170 ?auto_7168 ) ) ( OBJ-AT ?auto_7171 ?auto_7168 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7171 ?auto_7165 ?auto_7164 )
      ( DELIVER-2PKG-VERIFY ?auto_7165 ?auto_7166 ?auto_7164 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7191 - OBJ
      ?auto_7192 - OBJ
      ?auto_7193 - OBJ
      ?auto_7190 - LOCATION
    )
    :vars
    (
      ?auto_7197 - LOCATION
      ?auto_7194 - CITY
      ?auto_7196 - TRUCK
      ?auto_7195 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7192 ?auto_7191 ) ) ( not ( = ?auto_7193 ?auto_7191 ) ) ( not ( = ?auto_7193 ?auto_7192 ) ) ( IN-CITY ?auto_7197 ?auto_7194 ) ( IN-CITY ?auto_7190 ?auto_7194 ) ( not ( = ?auto_7190 ?auto_7197 ) ) ( OBJ-AT ?auto_7193 ?auto_7197 ) ( OBJ-AT ?auto_7192 ?auto_7197 ) ( TRUCK-AT ?auto_7196 ?auto_7195 ) ( IN-CITY ?auto_7195 ?auto_7194 ) ( not ( = ?auto_7190 ?auto_7195 ) ) ( not ( = ?auto_7197 ?auto_7195 ) ) ( OBJ-AT ?auto_7191 ?auto_7195 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7191 ?auto_7193 ?auto_7190 )
      ( DELIVER-3PKG-VERIFY ?auto_7191 ?auto_7192 ?auto_7193 ?auto_7190 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7208 - OBJ
      ?auto_7209 - OBJ
      ?auto_7210 - OBJ
      ?auto_7207 - LOCATION
    )
    :vars
    (
      ?auto_7214 - LOCATION
      ?auto_7211 - CITY
      ?auto_7213 - TRUCK
      ?auto_7212 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7209 ?auto_7208 ) ) ( not ( = ?auto_7210 ?auto_7208 ) ) ( not ( = ?auto_7210 ?auto_7209 ) ) ( IN-CITY ?auto_7214 ?auto_7211 ) ( IN-CITY ?auto_7207 ?auto_7211 ) ( not ( = ?auto_7207 ?auto_7214 ) ) ( OBJ-AT ?auto_7209 ?auto_7214 ) ( OBJ-AT ?auto_7210 ?auto_7214 ) ( TRUCK-AT ?auto_7213 ?auto_7212 ) ( IN-CITY ?auto_7212 ?auto_7211 ) ( not ( = ?auto_7207 ?auto_7212 ) ) ( not ( = ?auto_7214 ?auto_7212 ) ) ( OBJ-AT ?auto_7208 ?auto_7212 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7208 ?auto_7209 ?auto_7207 )
      ( DELIVER-3PKG-VERIFY ?auto_7208 ?auto_7209 ?auto_7210 ?auto_7207 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7225 - OBJ
      ?auto_7226 - OBJ
      ?auto_7227 - OBJ
      ?auto_7224 - LOCATION
    )
    :vars
    (
      ?auto_7231 - LOCATION
      ?auto_7228 - CITY
      ?auto_7230 - TRUCK
      ?auto_7229 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7226 ?auto_7225 ) ) ( not ( = ?auto_7227 ?auto_7225 ) ) ( not ( = ?auto_7227 ?auto_7226 ) ) ( IN-CITY ?auto_7231 ?auto_7228 ) ( IN-CITY ?auto_7224 ?auto_7228 ) ( not ( = ?auto_7224 ?auto_7231 ) ) ( OBJ-AT ?auto_7227 ?auto_7231 ) ( OBJ-AT ?auto_7225 ?auto_7231 ) ( TRUCK-AT ?auto_7230 ?auto_7229 ) ( IN-CITY ?auto_7229 ?auto_7228 ) ( not ( = ?auto_7224 ?auto_7229 ) ) ( not ( = ?auto_7231 ?auto_7229 ) ) ( OBJ-AT ?auto_7226 ?auto_7229 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7226 ?auto_7227 ?auto_7224 )
      ( DELIVER-3PKG-VERIFY ?auto_7225 ?auto_7226 ?auto_7227 ?auto_7224 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7242 - OBJ
      ?auto_7243 - OBJ
      ?auto_7244 - OBJ
      ?auto_7241 - LOCATION
    )
    :vars
    (
      ?auto_7248 - LOCATION
      ?auto_7245 - CITY
      ?auto_7247 - TRUCK
      ?auto_7246 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7243 ?auto_7242 ) ) ( not ( = ?auto_7244 ?auto_7242 ) ) ( not ( = ?auto_7244 ?auto_7243 ) ) ( IN-CITY ?auto_7248 ?auto_7245 ) ( IN-CITY ?auto_7241 ?auto_7245 ) ( not ( = ?auto_7241 ?auto_7248 ) ) ( OBJ-AT ?auto_7243 ?auto_7248 ) ( OBJ-AT ?auto_7242 ?auto_7248 ) ( TRUCK-AT ?auto_7247 ?auto_7246 ) ( IN-CITY ?auto_7246 ?auto_7245 ) ( not ( = ?auto_7241 ?auto_7246 ) ) ( not ( = ?auto_7248 ?auto_7246 ) ) ( OBJ-AT ?auto_7244 ?auto_7246 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7244 ?auto_7243 ?auto_7241 )
      ( DELIVER-3PKG-VERIFY ?auto_7242 ?auto_7243 ?auto_7244 ?auto_7241 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7277 - OBJ
      ?auto_7278 - OBJ
      ?auto_7279 - OBJ
      ?auto_7276 - LOCATION
    )
    :vars
    (
      ?auto_7283 - LOCATION
      ?auto_7280 - CITY
      ?auto_7282 - TRUCK
      ?auto_7281 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7278 ?auto_7277 ) ) ( not ( = ?auto_7279 ?auto_7277 ) ) ( not ( = ?auto_7279 ?auto_7278 ) ) ( IN-CITY ?auto_7283 ?auto_7280 ) ( IN-CITY ?auto_7276 ?auto_7280 ) ( not ( = ?auto_7276 ?auto_7283 ) ) ( OBJ-AT ?auto_7277 ?auto_7283 ) ( OBJ-AT ?auto_7279 ?auto_7283 ) ( TRUCK-AT ?auto_7282 ?auto_7281 ) ( IN-CITY ?auto_7281 ?auto_7280 ) ( not ( = ?auto_7276 ?auto_7281 ) ) ( not ( = ?auto_7283 ?auto_7281 ) ) ( OBJ-AT ?auto_7278 ?auto_7281 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7278 ?auto_7277 ?auto_7276 )
      ( DELIVER-3PKG-VERIFY ?auto_7277 ?auto_7278 ?auto_7279 ?auto_7276 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7294 - OBJ
      ?auto_7295 - OBJ
      ?auto_7296 - OBJ
      ?auto_7293 - LOCATION
    )
    :vars
    (
      ?auto_7300 - LOCATION
      ?auto_7297 - CITY
      ?auto_7299 - TRUCK
      ?auto_7298 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_7295 ?auto_7294 ) ) ( not ( = ?auto_7296 ?auto_7294 ) ) ( not ( = ?auto_7296 ?auto_7295 ) ) ( IN-CITY ?auto_7300 ?auto_7297 ) ( IN-CITY ?auto_7293 ?auto_7297 ) ( not ( = ?auto_7293 ?auto_7300 ) ) ( OBJ-AT ?auto_7294 ?auto_7300 ) ( OBJ-AT ?auto_7295 ?auto_7300 ) ( TRUCK-AT ?auto_7299 ?auto_7298 ) ( IN-CITY ?auto_7298 ?auto_7297 ) ( not ( = ?auto_7293 ?auto_7298 ) ) ( not ( = ?auto_7300 ?auto_7298 ) ) ( OBJ-AT ?auto_7296 ?auto_7298 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7296 ?auto_7294 ?auto_7293 )
      ( DELIVER-3PKG-VERIFY ?auto_7294 ?auto_7295 ?auto_7296 ?auto_7293 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7348 - OBJ
      ?auto_7347 - LOCATION
    )
    :vars
    (
      ?auto_7354 - OBJ
      ?auto_7353 - LOCATION
      ?auto_7349 - CITY
      ?auto_7352 - OBJ
      ?auto_7350 - LOCATION
      ?auto_7351 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7348 ?auto_7354 ) ) ( IN-CITY ?auto_7353 ?auto_7349 ) ( IN-CITY ?auto_7347 ?auto_7349 ) ( not ( = ?auto_7347 ?auto_7353 ) ) ( OBJ-AT ?auto_7348 ?auto_7353 ) ( not ( = ?auto_7352 ?auto_7354 ) ) ( not ( = ?auto_7348 ?auto_7352 ) ) ( OBJ-AT ?auto_7352 ?auto_7353 ) ( IN-CITY ?auto_7350 ?auto_7349 ) ( not ( = ?auto_7347 ?auto_7350 ) ) ( not ( = ?auto_7353 ?auto_7350 ) ) ( OBJ-AT ?auto_7354 ?auto_7350 ) ( TRUCK-AT ?auto_7351 ?auto_7347 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7351 ?auto_7347 ?auto_7350 ?auto_7349 )
      ( DELIVER-2PKG ?auto_7354 ?auto_7348 ?auto_7347 )
      ( DELIVER-1PKG-VERIFY ?auto_7348 ?auto_7347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7356 - OBJ
      ?auto_7357 - OBJ
      ?auto_7355 - LOCATION
    )
    :vars
    (
      ?auto_7362 - LOCATION
      ?auto_7359 - CITY
      ?auto_7358 - OBJ
      ?auto_7361 - LOCATION
      ?auto_7360 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7357 ?auto_7356 ) ) ( IN-CITY ?auto_7362 ?auto_7359 ) ( IN-CITY ?auto_7355 ?auto_7359 ) ( not ( = ?auto_7355 ?auto_7362 ) ) ( OBJ-AT ?auto_7357 ?auto_7362 ) ( not ( = ?auto_7358 ?auto_7356 ) ) ( not ( = ?auto_7357 ?auto_7358 ) ) ( OBJ-AT ?auto_7358 ?auto_7362 ) ( IN-CITY ?auto_7361 ?auto_7359 ) ( not ( = ?auto_7355 ?auto_7361 ) ) ( not ( = ?auto_7362 ?auto_7361 ) ) ( OBJ-AT ?auto_7356 ?auto_7361 ) ( TRUCK-AT ?auto_7360 ?auto_7355 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7357 ?auto_7355 )
      ( DELIVER-2PKG-VERIFY ?auto_7356 ?auto_7357 ?auto_7355 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7364 - OBJ
      ?auto_7365 - OBJ
      ?auto_7363 - LOCATION
    )
    :vars
    (
      ?auto_7370 - OBJ
      ?auto_7369 - LOCATION
      ?auto_7367 - CITY
      ?auto_7366 - LOCATION
      ?auto_7368 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7365 ?auto_7364 ) ) ( not ( = ?auto_7365 ?auto_7370 ) ) ( IN-CITY ?auto_7369 ?auto_7367 ) ( IN-CITY ?auto_7363 ?auto_7367 ) ( not ( = ?auto_7363 ?auto_7369 ) ) ( OBJ-AT ?auto_7365 ?auto_7369 ) ( not ( = ?auto_7364 ?auto_7370 ) ) ( OBJ-AT ?auto_7364 ?auto_7369 ) ( IN-CITY ?auto_7366 ?auto_7367 ) ( not ( = ?auto_7363 ?auto_7366 ) ) ( not ( = ?auto_7369 ?auto_7366 ) ) ( OBJ-AT ?auto_7370 ?auto_7366 ) ( TRUCK-AT ?auto_7368 ?auto_7363 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7370 ?auto_7365 ?auto_7363 )
      ( DELIVER-2PKG-VERIFY ?auto_7364 ?auto_7365 ?auto_7363 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7372 - OBJ
      ?auto_7373 - OBJ
      ?auto_7371 - LOCATION
    )
    :vars
    (
      ?auto_7378 - LOCATION
      ?auto_7375 - CITY
      ?auto_7377 - OBJ
      ?auto_7374 - LOCATION
      ?auto_7376 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7373 ?auto_7372 ) ) ( IN-CITY ?auto_7378 ?auto_7375 ) ( IN-CITY ?auto_7371 ?auto_7375 ) ( not ( = ?auto_7371 ?auto_7378 ) ) ( OBJ-AT ?auto_7372 ?auto_7378 ) ( not ( = ?auto_7377 ?auto_7373 ) ) ( not ( = ?auto_7372 ?auto_7377 ) ) ( OBJ-AT ?auto_7377 ?auto_7378 ) ( IN-CITY ?auto_7374 ?auto_7375 ) ( not ( = ?auto_7371 ?auto_7374 ) ) ( not ( = ?auto_7378 ?auto_7374 ) ) ( OBJ-AT ?auto_7373 ?auto_7374 ) ( TRUCK-AT ?auto_7376 ?auto_7371 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7373 ?auto_7372 ?auto_7371 )
      ( DELIVER-2PKG-VERIFY ?auto_7372 ?auto_7373 ?auto_7371 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7380 - OBJ
      ?auto_7381 - OBJ
      ?auto_7379 - LOCATION
    )
    :vars
    (
      ?auto_7386 - OBJ
      ?auto_7385 - LOCATION
      ?auto_7383 - CITY
      ?auto_7382 - LOCATION
      ?auto_7384 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7381 ?auto_7380 ) ) ( not ( = ?auto_7380 ?auto_7386 ) ) ( IN-CITY ?auto_7385 ?auto_7383 ) ( IN-CITY ?auto_7379 ?auto_7383 ) ( not ( = ?auto_7379 ?auto_7385 ) ) ( OBJ-AT ?auto_7380 ?auto_7385 ) ( not ( = ?auto_7381 ?auto_7386 ) ) ( OBJ-AT ?auto_7381 ?auto_7385 ) ( IN-CITY ?auto_7382 ?auto_7383 ) ( not ( = ?auto_7379 ?auto_7382 ) ) ( not ( = ?auto_7385 ?auto_7382 ) ) ( OBJ-AT ?auto_7386 ?auto_7382 ) ( TRUCK-AT ?auto_7384 ?auto_7379 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7386 ?auto_7380 ?auto_7379 )
      ( DELIVER-2PKG-VERIFY ?auto_7380 ?auto_7381 ?auto_7379 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7406 - OBJ
      ?auto_7407 - OBJ
      ?auto_7408 - OBJ
      ?auto_7405 - LOCATION
    )
    :vars
    (
      ?auto_7412 - LOCATION
      ?auto_7410 - CITY
      ?auto_7409 - LOCATION
      ?auto_7411 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7407 ?auto_7406 ) ) ( not ( = ?auto_7408 ?auto_7406 ) ) ( not ( = ?auto_7408 ?auto_7407 ) ) ( IN-CITY ?auto_7412 ?auto_7410 ) ( IN-CITY ?auto_7405 ?auto_7410 ) ( not ( = ?auto_7405 ?auto_7412 ) ) ( OBJ-AT ?auto_7408 ?auto_7412 ) ( OBJ-AT ?auto_7407 ?auto_7412 ) ( IN-CITY ?auto_7409 ?auto_7410 ) ( not ( = ?auto_7405 ?auto_7409 ) ) ( not ( = ?auto_7412 ?auto_7409 ) ) ( OBJ-AT ?auto_7406 ?auto_7409 ) ( TRUCK-AT ?auto_7411 ?auto_7405 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7406 ?auto_7408 ?auto_7405 )
      ( DELIVER-3PKG-VERIFY ?auto_7406 ?auto_7407 ?auto_7408 ?auto_7405 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7423 - OBJ
      ?auto_7424 - OBJ
      ?auto_7425 - OBJ
      ?auto_7422 - LOCATION
    )
    :vars
    (
      ?auto_7429 - LOCATION
      ?auto_7427 - CITY
      ?auto_7426 - LOCATION
      ?auto_7428 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7424 ?auto_7423 ) ) ( not ( = ?auto_7425 ?auto_7423 ) ) ( not ( = ?auto_7425 ?auto_7424 ) ) ( IN-CITY ?auto_7429 ?auto_7427 ) ( IN-CITY ?auto_7422 ?auto_7427 ) ( not ( = ?auto_7422 ?auto_7429 ) ) ( OBJ-AT ?auto_7424 ?auto_7429 ) ( OBJ-AT ?auto_7425 ?auto_7429 ) ( IN-CITY ?auto_7426 ?auto_7427 ) ( not ( = ?auto_7422 ?auto_7426 ) ) ( not ( = ?auto_7429 ?auto_7426 ) ) ( OBJ-AT ?auto_7423 ?auto_7426 ) ( TRUCK-AT ?auto_7428 ?auto_7422 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7423 ?auto_7424 ?auto_7422 )
      ( DELIVER-3PKG-VERIFY ?auto_7423 ?auto_7424 ?auto_7425 ?auto_7422 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7440 - OBJ
      ?auto_7441 - OBJ
      ?auto_7442 - OBJ
      ?auto_7439 - LOCATION
    )
    :vars
    (
      ?auto_7446 - LOCATION
      ?auto_7444 - CITY
      ?auto_7443 - LOCATION
      ?auto_7445 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7441 ?auto_7440 ) ) ( not ( = ?auto_7442 ?auto_7440 ) ) ( not ( = ?auto_7442 ?auto_7441 ) ) ( IN-CITY ?auto_7446 ?auto_7444 ) ( IN-CITY ?auto_7439 ?auto_7444 ) ( not ( = ?auto_7439 ?auto_7446 ) ) ( OBJ-AT ?auto_7442 ?auto_7446 ) ( OBJ-AT ?auto_7440 ?auto_7446 ) ( IN-CITY ?auto_7443 ?auto_7444 ) ( not ( = ?auto_7439 ?auto_7443 ) ) ( not ( = ?auto_7446 ?auto_7443 ) ) ( OBJ-AT ?auto_7441 ?auto_7443 ) ( TRUCK-AT ?auto_7445 ?auto_7439 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7441 ?auto_7442 ?auto_7439 )
      ( DELIVER-3PKG-VERIFY ?auto_7440 ?auto_7441 ?auto_7442 ?auto_7439 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7457 - OBJ
      ?auto_7458 - OBJ
      ?auto_7459 - OBJ
      ?auto_7456 - LOCATION
    )
    :vars
    (
      ?auto_7463 - LOCATION
      ?auto_7461 - CITY
      ?auto_7460 - LOCATION
      ?auto_7462 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7458 ?auto_7457 ) ) ( not ( = ?auto_7459 ?auto_7457 ) ) ( not ( = ?auto_7459 ?auto_7458 ) ) ( IN-CITY ?auto_7463 ?auto_7461 ) ( IN-CITY ?auto_7456 ?auto_7461 ) ( not ( = ?auto_7456 ?auto_7463 ) ) ( OBJ-AT ?auto_7458 ?auto_7463 ) ( OBJ-AT ?auto_7457 ?auto_7463 ) ( IN-CITY ?auto_7460 ?auto_7461 ) ( not ( = ?auto_7456 ?auto_7460 ) ) ( not ( = ?auto_7463 ?auto_7460 ) ) ( OBJ-AT ?auto_7459 ?auto_7460 ) ( TRUCK-AT ?auto_7462 ?auto_7456 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7459 ?auto_7458 ?auto_7456 )
      ( DELIVER-3PKG-VERIFY ?auto_7457 ?auto_7458 ?auto_7459 ?auto_7456 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7492 - OBJ
      ?auto_7493 - OBJ
      ?auto_7494 - OBJ
      ?auto_7491 - LOCATION
    )
    :vars
    (
      ?auto_7498 - LOCATION
      ?auto_7496 - CITY
      ?auto_7495 - LOCATION
      ?auto_7497 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7493 ?auto_7492 ) ) ( not ( = ?auto_7494 ?auto_7492 ) ) ( not ( = ?auto_7494 ?auto_7493 ) ) ( IN-CITY ?auto_7498 ?auto_7496 ) ( IN-CITY ?auto_7491 ?auto_7496 ) ( not ( = ?auto_7491 ?auto_7498 ) ) ( OBJ-AT ?auto_7492 ?auto_7498 ) ( OBJ-AT ?auto_7494 ?auto_7498 ) ( IN-CITY ?auto_7495 ?auto_7496 ) ( not ( = ?auto_7491 ?auto_7495 ) ) ( not ( = ?auto_7498 ?auto_7495 ) ) ( OBJ-AT ?auto_7493 ?auto_7495 ) ( TRUCK-AT ?auto_7497 ?auto_7491 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7493 ?auto_7492 ?auto_7491 )
      ( DELIVER-3PKG-VERIFY ?auto_7492 ?auto_7493 ?auto_7494 ?auto_7491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7509 - OBJ
      ?auto_7510 - OBJ
      ?auto_7511 - OBJ
      ?auto_7508 - LOCATION
    )
    :vars
    (
      ?auto_7515 - LOCATION
      ?auto_7513 - CITY
      ?auto_7512 - LOCATION
      ?auto_7514 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7510 ?auto_7509 ) ) ( not ( = ?auto_7511 ?auto_7509 ) ) ( not ( = ?auto_7511 ?auto_7510 ) ) ( IN-CITY ?auto_7515 ?auto_7513 ) ( IN-CITY ?auto_7508 ?auto_7513 ) ( not ( = ?auto_7508 ?auto_7515 ) ) ( OBJ-AT ?auto_7509 ?auto_7515 ) ( OBJ-AT ?auto_7510 ?auto_7515 ) ( IN-CITY ?auto_7512 ?auto_7513 ) ( not ( = ?auto_7508 ?auto_7512 ) ) ( not ( = ?auto_7515 ?auto_7512 ) ) ( OBJ-AT ?auto_7511 ?auto_7512 ) ( TRUCK-AT ?auto_7514 ?auto_7508 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7511 ?auto_7509 ?auto_7508 )
      ( DELIVER-3PKG-VERIFY ?auto_7509 ?auto_7510 ?auto_7511 ?auto_7508 ) )
  )

)

