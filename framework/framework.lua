

function SetupSolution(slnName)
	solution(slnName)
		configurations {"Debug", "Release"}
		defines {"_CRT_SECURE_NO_WARNINGS", "_CRT_SECURE_NO_DEPRECATE", "_SCL_SECURE_NO_WARNINGS", "TIXML_USE_STL"}
		defines {"FREEGLUT_STATIC", "WIN32"}
end

function SetupProject(projName, ...)
	project(projName)
		kind "ConsoleApp"
		language "c++"
		
		files { "../framework/framework.cpp" }
		files { "../framework/framework.h" }
		files {...}
		targetdir "bin"

		includedirs {"../freeglut-2.6.0/include", "../glloader/include",
			"../FreeImage/dist", "../glm-0.9.0.0", "../tinyxml"}

		configuration "Debug"
			defines {"DEBUG", "_DEBUG"}
			flags "Symbols"
			links "../freeglut-2.6.0/VisualStudio2008Static/debug/freeglut_static"
			links "../FreeImage/dist/FreeImageD"
			links "../glloader/lib/glloaderD"
			links "../tinyxml/lib/tinyxml_pmD"
			targetname(projName .. "D")
		
		configuration "Release"
			defines {"RELEASE", "NDEBUG"};
			links "../freeglut-2.6.0/VisualStudio2008Static/release/freeglut_static"
			links "../FreeImage/dist/FreeImage"
			links "../glloader/lib/glloader"
			links "../tinyxml/lib/tinyxml_pm"
			targetname(projName)
end

