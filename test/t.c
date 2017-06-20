
#include "../src/saycaw.h"

#include "../test_framework/cheat.h"


CHEAT_TEST(Test_XXX,
  cheat_assert(1 == 1);
  cheat_assert_not( 2 == 1);
)

CHEAT_TEST(Test_CCC,
  cheat_assert( 1 == 1);
)

CHEAT_TEST(Test_GetNumber,
  cheat_assert(GetNumber(1) == 1);    
)
