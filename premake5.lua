project "xxHash"
	kind "StaticLib"
	language "C"
	warnings "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"xxhash.h",
		"xxhash.c"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		staticruntime "off"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		staticruntime "off"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		staticruntime "on"
		optimize "on"
        symbols "off"
