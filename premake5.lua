
workspace "RayTracingRND"
	configurations { "Debug", "Release", "Dist" }
	targetdir "build"
	startproject "Sandbox"
    platforms { "x64" }
    
	filter "language:C++ or language:C"
		architecture "x64"
	filter ""


outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
	cppdialect "C++17"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files 
	{ 
		"%{prj.name}/src/**.h", 
		"%{prj.name}/src/**.c", 
		"%{prj.name}/src/**.hpp", 
		"%{prj.name}/src/**.cpp", 
	}

    filter "system:windows"
		systemversion "latest"

		defines 
		{ 
			"PLATFORM_WINDOWS"
		}

    filter "configurations:Debug"
		symbols "on"

        defines
		{
			"DEBUG",
			"TRACK_MEMORY"
		}

    filter "configurations:Release"
		optimize "on"

        defines
		{
			"RELEASE",
			"TRACK_MEMORY"
		}

    filter "configurations:Dist"
		optimize "on"

        defines
        {
            "DIST"
        }