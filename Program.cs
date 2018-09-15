using System;

namespace TravisExperiments
{
	class Program
	{
		static void Main(string[] args)
		{
			#if NET46
				Console.WriteLine("built NET46");
			#else
				Console.WriteLine("built dotnet core");
			#endif
		}
	}
}
