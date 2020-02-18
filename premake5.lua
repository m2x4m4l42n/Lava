workspace "Lava"
	architecture "x86_64"
	startproject "Lava-Test"
	
	configurations
	{ 
		"Debug", 
		"Release"
	}

project "Lava-Core"
	location "Lava-Core"
	kind "StaticLib"
	language "C++"
	targetdir ("bin/%{cfg.buildcfg}/%{prj.name}/")
	objdir ("bin-int/%{cfg.buildcfg}/%{prj.name}/")
	targetname "Lava"
	staticruntime "on"
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.hpp",
		"%{prj.name}/src/**.cpp"
	}
	
	
project "Lava-Test"
	location "Lava-Test"
	kind "ConsoleApp"
	language "C++"
	targetdir ("bin/%{cfg.buildcfg}/%{prj.name}/")
	objdir ("bin-int/%{cfg.buildcfg}/%{prj.name}/")
	staticruntime "on"
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.hpp",
		"%{prj.name}/src/**.cpp"
	}
	
	sysincludedirs
	{
		"Lava-Core/src"
	}
	
	links
	{
		"Lava-Core"
	}