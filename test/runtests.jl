##### Beginning of file

import InteractiveUtils # stdlib
import Pkg # stdlib
import Test # stdlib

@info(string("Julia depot paths: "), Base.DEPOT_PATH)
@info(string("Julia load paths: "), Base.LOAD_PATH)

@info(string("Julia version info: ",))
InteractiveUtils.versioninfo(verbose=true)

@info(string("Output of Pkg.status():",),)
Pkg.status()

@info(string("Output of Pkg.status(Pkg.Types.PKGMODE_PROJECT):",),)
Pkg.status(Pkg.Types.PKGMODE_PROJECT)

@info(string("Output of Pkg.status(Pkg.Types.PKGMODE_MANIFEST):",),)
Pkg.status(Pkg.Types.PKGMODE_MANIFEST)

@info(string("Output of Pkg.status(Pkg.Types.PKGMODE_COMBINED):",),)
Pkg.status(Pkg.Types.PKGMODE_COMBINED)

@info(string("Attempting to import PredictMDFull...",))
import PredictMDFull
@info(string("Successfully imported PredictMDFull.",))
@info(string("PredictMDFull version: "),PredictMDFull.version(),)
@info(string("PredictMDFull package directory: "),PredictMDFull.package_directory(),)

@info(string("Julia depot paths: "), Base.DEPOT_PATH)
@info(string("Julia load paths: "), Base.LOAD_PATH)

Test.@testset "Unit tests           " begin
    testmodulea_filename::String = joinpath("TestModuleA", "TestModuleA.jl")
    testmoduleb_filename::String  = joinpath(
        "TestModuleB", "directory1", "directory2", "directory3",
        "directory4", "directory5", "TestModuleB.jl",
        )
    testmodulec_filename::String  = joinpath(mktempdir(), "TestModuleC.jl")
    rm(testmodulec_filename; force = true, recursive = true)
    open(testmodulec_filename, "w") do io
        write(io, "module TestModuleC end")
    end
    include(testmodulea_filename)
    include(testmoduleb_filename)
    include(testmodulec_filename)
    include(joinpath("test_package_directory.jl"))
    include(joinpath("test_registry_url_list.jl"))
    include(joinpath("test_version.jl"))
end

Test.@testset "Import PredictMDExtra" begin
    include(joinpath("test_import_predictmdextra.jl"))
end

Test.@testset "Import PredictMD     " begin
    include(joinpath("test_import_predictmd.jl"))
end

Test.@testset "Test import_all()" begin
    include(joinpath("test_import_all.jl"))
end

##### End of file
