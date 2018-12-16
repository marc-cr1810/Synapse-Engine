#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Synapse {

	class SYNAPSE_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}

// Core log macros 
#define SYN_CORE_TRACE(...)    ::Synapse::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define SYN_CORE_INFO(...)     ::Synapse::Log::GetCoreLogger()->info(__VA_ARGS__)
#define SYN_CORE_WARN(...)     ::Synapse::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define SYN_CORE_ERROR(...)    ::Synapse::Log::GetCoreLogger()->error(__VA_ARGS__)
#define SYN_CORE_FATAL(...)    ::Synapse::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client log macros 
#define SYN_TRACE(...)         ::Synapse::Log::GetClientLogger()->trace(__VA_ARGS__)
#define SYN_INFO(...)          ::Synapse::Log::GetClientLogger()->info(__VA_ARGS__)
#define SYN_WARN(...)          ::Synapse::Log::GetClientLogger()->warn(__VA_ARGS__)
#define SYN_ERROR(...)         ::Synapse::Log::GetClientLogger()->error(__VA_ARGS__)
#define SYN_FATAL(...)         ::Synapse::Log::GetClientLogger()->fatal(__VA_ARGS__)