workspace "Synapse"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Synapse"
	location "Synapse"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"SYN_PLATFORM_WINDOWS",
			"SYN_BUILD_DLL"
		}

	filter "configurations:Debug"
		defines "SYN_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "SYN_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "SYN_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Synapse/vendor/spdlog/include",
		"Synapse/src"
	}

	links
	{
		"Synapse"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"SYN_PLATFORM_WINDOWS"
		}

		postbuildcommands
		{
			("{COPY} ../bin/" .. outputdir .. "/Synapse/Synapse.dll ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "SYN_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "SYN_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "SYN_DIST"
		optimize "On"