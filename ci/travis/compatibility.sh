#!/bin/bash

set -ev

julia --check-bounds=yes --color=yes ./ci/travis/package-overlap.jl

cd ~
rm -rf ~/.julia
rm -rf ~/environments
mkdir -p ~/environments/environment-predictmd-first
cd ~/environments/environment-predictmd-first
touch Project.toml
rm -rf ~/.julia
julia --project -e 'import Pkg; Pkg.develop(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMD.jl.git"))'
julia --project -e 'import Pkg; Pkg.develop(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMDExtra.jl.git"))'
julia --project -e 'import Pkg; Pkg.develop(Pkg.PackageSpec(path=ENV["TRAVIS_BUILD_DIR"]))'

cd ~
rm -rf ~/.julia
rm -rf ~/environments
mkdir -p ~/environments/environment-extra-first
cd ~/environments/environment-extra-first
touch Project.toml
rm -rf ~/.julia
julia --project -e 'import Pkg; Pkg.develop(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMDExtra.jl.git"))'
julia --project -e 'import Pkg; Pkg.develop(Pkg.PackageSpec(url="https://github.com/bcbi/PredictMD.jl.git"))'
julia --project -e 'import Pkg; Pkg.develop(Pkg.PackageSpec(path=ENV["TRAVIS_BUILD_DIR"]))'
