#!/bin/bash

set -ev

julia --check-bounds=yes --color=yes -e '
    import Pkg;
    Pkg.Registry.add("General");
    '

julia --check-bounds=yes --color=yes -e '
    import Pkg;
    Pkg.Registry.update();
    '

julia --check-bounds=yes --color=yes -e '
    import Pkg;
    Pkg.Registry.add(Pkg.RegistrySpec(name="BCBIRegistry",url="https://github.com/bcbi/BCBIRegistry.git",uuid="26a550a3-39fe-4af4-af6d-e8814c2b6dd9",));
    '

julia --check-bounds=yes --color=yes -e '
    import Pkg;
    Pkg.Registry.update();
    '

julia --check-bounds=yes --color=yes -e '
    import Pkg;
    Pkg.build("PredictMDFull");
    '

julia --check-bounds=yes --color=yes -e '
    import Pkg;
    Pkg.test("PredictMDFull"; coverage=true);
    '

julia --check-bounds=yes --color=yes -e '
    logger = Base.CoreLogging.current_logger_for_env(Base.CoreLogging.Debug, Symbol(splitext(basename(something(@__FILE__, "nothing")))[1]), something(@__MODULE__, "nothing"))
    if !isnothing(logger)
        if ispath(Base.active_project())
            println(logger.stream, "# Location of default environment Project.toml: \"$(Base.active_project())\"")
            println(logger.stream, "# Beginning of default environment Project.toml")
            println(logger.stream, read(Base.active_project(), String))
            println(logger.stream, "# End of default environment Project.toml")
        else
            println(logger.stream, "# File \"$(Base.active_project())\" does not exist")
        end
        if ispath(joinpath(dirname(Base.active_project()), "Manifest.toml"))
            println(logger.stream, "# Location of default environment Manifest.toml: \"$(joinpath(dirname(Base.active_project()), "Manifest.toml"))\"")
            println(logger.stream, "# Beginning of default environment Manifest.toml")
            println(logger.stream, read(joinpath(dirname(Base.active_project()), "Manifest.toml"),String))
            println(logger.stream, "# End of default environment Manifest.toml")
        else
            println(logger.stream, "# File \"$(joinpath(dirname(Base.active_project()), "Manifest.toml"))\" does not exist")
        end
    end
    '

julia --check-bounds=yes --color=yes -e '
    import Pkg;
    try Pkg.add("Coverage") catch end;
    '

julia --check-bounds=yes --color=yes -e '
    import Coverage;
    import PredictMDFull;
    cd(PredictMDFull.package_directory());
    Coverage.Codecov.submit(Coverage.Codecov.process_folder());
    '

julia --check-bounds=yes --color=yes -e '
    logger = Base.CoreLogging.current_logger_for_env(Base.CoreLogging.Debug, Symbol(splitext(basename(something(@__FILE__, "nothing")))[1]), something(@__MODULE__, "nothing"))
    if !isnothing(logger)
        if ispath(Base.active_project())
            println(logger.stream, "# Location of default environment Project.toml: \"$(Base.active_project())\"")
            println(logger.stream, "# Beginning of default environment Project.toml")
            println(logger.stream, read(Base.active_project(), String))
            println(logger.stream, "# End of default environment Project.toml")
        else
            println(logger.stream, "# File \"$(Base.active_project())\" does not exist")
        end
        if ispath(joinpath(dirname(Base.active_project()), "Manifest.toml"))
            println(logger.stream, "# Location of default environment Manifest.toml: \"$(joinpath(dirname(Base.active_project()), "Manifest.toml"))\"")
            println(logger.stream, "# Beginning of default environment Manifest.toml")
            println(logger.stream, read(joinpath(dirname(Base.active_project()), "Manifest.toml"),String))
            println(logger.stream, "# End of default environment Manifest.toml")
        else
            println(logger.stream, "# File \"$(joinpath(dirname(Base.active_project()), "Manifest.toml"))\" does not exist")
        end
    end
    '
