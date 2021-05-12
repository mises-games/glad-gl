project "Glad_GL"
    kind "StaticLib"
    language "C"
    staticruntime "on"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/glad/gl.h",
        "include/KHR/khrplatform.h",
        "src/gl.c"
    }

    includedirs
    {
        "include"
    }
    
    filter "system:windows"
        systemversion "latest"
        files
        {
            "include/glad/wgl.h",
            "src/wgl.c"
        }
    
    filter "system:linux"
        systemversion "latest"
        files
        {
            "include/glad/glx.h",
            "src/glx.c"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
