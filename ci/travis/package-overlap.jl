import Pkg

function maketempdir()::String
    tmpdir = mktempdir()
    atexit(() -> rm(tmpdir; force = true, recursive = true))
    return tmpdir
end

function allowed_intersection_predictmdfull_predictmd()::Vector{String}
    result::Vector{String} = String[
        "Distributed",
        "Pkg"
        ]
    return result
end

function allowed_intersection_predictmdfull_predictmdextra()::Vector{String}
    result::Vector{String} = String[
        "Distributed",
        "Pkg"
        ]
    return result
end

function main()::Nothing
    predictmdfull_dir = pwd()
    predictmdfull_toml_file_name = joinpath(predictmdfull_dir, "Project.toml")
    predictmdfull_toml = Pkg.TOML.parsefile(predictmdfull_toml_file_name)

    predictmd_toml_file_url = "https://raw.githubusercontent.com/bcbi/PredictMD.jl/master/Project.toml"
    predictmdextra_toml_file_url = "https://raw.githubusercontent.com/bcbi/PredictMDExtra.jl/master/Project.toml"
    tmpdir_predictmd = maketempdir()
    tmpdir_predictmdextra = maketempdir()
    predictmd_toml_file_name = joinpath(tmpdir_predictmd, "Project.toml")
    predictmdextra_toml_file_name = joinpath(tmpdir_predictmdextra, "Project.toml")
    Base.download(predictmd_toml_file_url, predictmd_toml_file_name)
    Base.download(predictmdextra_toml_file_url, predictmdextra_toml_file_name)
    predictmd_toml = Pkg.TOML.parsefile(predictmd_toml_file_name)
    predictmdextra_toml = Pkg.TOML.parsefile(predictmdextra_toml_file_name)
    rm(tmpdir_predictmd; force = true, recursive = true)
    rm(tmpdir_predictmdextra; force = true, recursive = true)

    predictmd_deps = sort(unique(keys(predictmd_toml["deps"])))
    predictmdextra_deps = sort(unique(keys(predictmdextra_toml["deps"])))
    predictmdfull_deps = sort(unique(keys(predictmdfull_toml["deps"])))

    intersection_predictmdfull_predictmd = intersect(predictmdfull_deps, predictmd_deps)
    intersection_predictmdfull_predictmdextra = intersect(predictmdfull_deps, predictmdextra_deps)

    @info("Actual intersection of PredictMDFull and PredictMD", intersection_predictmdfull_predictmd, repr(intersection_predictmdfull_predictmd))
    @info("Allowed intersection of PredictMDFull and PredictMD", allowed_intersection_predictmdfull_predictmd(), repr(allowed_intersection_predictmdfull_predictmd()))
    if !issubset(intersection_predictmdfull_predictmd, allowed_intersection_predictmdfull_predictmd())
        error("Intersection of PredictMDFull and PredictMD contains non-allowed packages")
    end

    @info("Actual intersection of PredictMDFull and PredictMDExtra", intersection_predictmdfull_predictmdextra, repr(intersection_predictmdfull_predictmdextra))
    @info("Allowed intersection of PredictMDFull and PredictMDExtra", allowed_intersection_predictmdfull_predictmdextra(), repr(allowed_intersection_predictmdfull_predictmdextra()))
    if !issubset(intersection_predictmdfull_predictmdextra, allowed_intersection_predictmdfull_predictmdextra())
        error("Intersection of PredictMDFull and PredictMDExtra contains non-allowed packages")
    end
end

main()
