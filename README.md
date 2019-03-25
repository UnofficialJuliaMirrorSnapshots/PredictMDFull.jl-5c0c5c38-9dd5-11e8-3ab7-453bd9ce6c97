<!-- Beginning of file -->

# PredictMDFull - Install PredictMD and all of its dependencies
# Main repository: [bcbi/PredictMD.jl](https://github.com/bcbi/PredictMD.jl)
# Website: [https://predictmd.net](https://predictmd.net)

<a href="https://www.repostatus.org/#active"><img src="https://www.repostatus.org/badges/latest/active.svg" alt="Project Status: Active – The project has reached a stable, usable state and is being actively developed." /></a>

PredictMDFull provides users with a convenient way of installing [PredictMD](https://predictmd.net) and all of its Julia dependencies.

| Table of Contents |
| ----------------- |
| [1. Installation](#installation) |
| [2. CI/CD](#cicd) |

## Installation

To install PredictMDFull, open Julia and run the following lines:
```julia
import Pkg;
Pkg.add(Pkg.PackageSpec(rev="master", url="https://github.com/bcbi/PredictMDExtra.jl",));
# Pkg.add(Pkg.PackageSpec(rev="master", url="https://github.com/bcbi/PredictMD.jl",));
Pkg.add(Pkg.PackageSpec(rev="master", url="https://github.com/bcbi/PredictMDFull.jl",));
```

## CI/CD

<table>
    <thead>
        <tr>
            <th></th>
            <th>master (stable)</th>
            <th>develop (latest)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Travis CI</td>
            <td><a href="https://travis-ci.org/bcbi/PredictMDFull.jl/branches">
            <img
            src="https://travis-ci.org/bcbi/PredictMDFull.jl.svg?branch=master"
            /></a></td>
            <td><a href="https://travis-ci.org/bcbi/PredictMDFull.jl/branches">
            <img
            src="https://travis-ci.org/bcbi/PredictMDFull.jl.svg?branch=develop"
            /></a></td>
        </tr>
        <!--<tr>
            <td>AppVeyor CI</td>
            <td>
            <a
            href="https://ci.appveyor.com/project/mirestrepo/predictmdfull-jl/history">
            <img
            title="AppVeyor build status (master)" src="https://ci.appveyor.com/api/projects/status/github/bcbi/PredictMDFull.jl?branch=master&svg=true"
            />
            </a></td>
            <td><a href="https://ci.appveyor.com/project/mirestrepo/predictmdfull-jl/history">
            <img
            src="https://ci.appveyor.com/api/projects/status/github/bcbi/PredictMDFull.jl?branch=develop&svg=true"
            />
            </a></td>
        </tr>-->
        <tr>
            <td>CodeCov</td>
            <td>
            <a
            href="https://codecov.io/gh/bcbi/PredictMDFull.jl/branch/master">
            <img
            src="https://codecov.io/gh/bcbi/PredictMDFull.jl/branch/master/graph/badge.svg"
            /></a></td>
            <td>
            <a
            href="https://codecov.io/gh/bcbi/PredictMDFull.jl/branch/develop">
            <img src="https://codecov.io/gh/bcbi/PredictMDFull.jl/branch/develop/graph/badge.svg"
            /></a></td>
        </tr>
    </tbody>
</table>

<!-- End of file -->
