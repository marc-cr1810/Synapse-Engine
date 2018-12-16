#pragma once

#ifdef SYN_PLATFORM_WINDOWS
	#ifdef SYN_BUILD_DLL
		#define SYNAPSE_API	__declspec(dllexport)
	#else
		#define SYNAPSE_API	__declspec(dllimport)
	#endif
#else
	#error Synapse is only supported on Windows systems
#endif