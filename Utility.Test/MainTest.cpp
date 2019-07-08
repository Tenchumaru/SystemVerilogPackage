#include "stdafx.h"
#include "CppUnitTest.h"

extern "C" __declspec(dllimport) void* ParseText(char const* s, unsigned& count);

using namespace Microsoft::VisualStudio::CppUnitTestFramework;

namespace UtilityTest
{		
	TEST_CLASS(MainTest)
	{
	public:
		
		TEST_METHOD(TestMethod1)
		{
			std::ifstream fin("../../Flurbie/sdram_writer.sv");
			std::string text((std::istreambuf_iterator<char>(fin)), (std::istreambuf_iterator<char>()));
			unsigned n;
			auto result = ParseText(text.c_str(), n);
			Assert::IsNotNull(result);
		}

	};
}